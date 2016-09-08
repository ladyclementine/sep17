class CartController < ProfileController
before_action :verify_cart_count, only: [:create]
  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_events = Event.find(cart_ids)
    @user = current_user
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0
    @payment = Payment.new
    @time = Time.now
    @package = Package.find(current_user.package_id)
    @user_cart = @package.event_kind_count(current_user)
    @cart_total = @package.cart_total_price(current_user)
  end

  def new
    cart_ids = $redis.smembers current_user_cart
    @cart_events = Event.find(cart_ids)
    @user = current_user
    @events = Event.all
    @eventsDays = Event.days
    @scheduleHash = Event.appointments
    @number = 0
  end 


  def create
    cart_ids = $redis.smembers current_user_cart
    @payment = Payment.new(user_id: current_user.id) 
    @payment.method = payment_params[:method]
    @cart_events = Event.find(cart_ids)

    
    if !@cart_events.empty?
      case payment_params[:method]
      when 'Depósito bancário'
        if @payment.save
          Purchase.create_purchases(current_user)
          redirect_to :my_home, notice: 'Verifique a informações para efetuar o pagamento.' 
        else
          render 'show', notice: 'Erro ao efetuar pagamento!'
        end
      when 'Em espécie(presencial)'
        if @payment.save
          Purchase.create_purchases(current_user)
          redirect_to :my_home, notice: 'Verifique a informações para efetuar o pagamento.'
        else
          render 'show', notice: 'Erro ao efetuar pagamento!'
        end
      when 'PagSeguro'
        if pag_seguro && @payment.save
          Purchase.create_purchases(current_user)
          redirect_to  pag_seguro.url
        else
          render 'show', notice: 'Erro ao efetuar pagamento!'
        end
      end
    else
      render 'show', notice: 'Seu carrinho está vazio!'
    end
  end

  def add
    $redis.sadd current_user_cart, params[:id]

   # respond_to do |format|
    #  format.js {render json: current_user.cart_count,  status: 200}
    #end 
    redirect_to :back
  end

  def remove
    $redis.srem current_user_cart, params[:id]
    #respond_to do |format|

     # format.js {render json: current_user.cart_count , status: 200}
    #end 
    redirect_to :back
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end

  def pag_seguro
    # O modo como você irá armazenar os produtos que estão sendo comprados
    # depende de você. Neste caso, temos um modelo Order que referência os
    # produtos que estão sendo comprados.
    order = current_user.id
    @cart = current_user.get_cart_events

    #payment = PagSeguro::PaymentRequest.new

    # Você também pode fazer o request de pagamento usando credenciais
    # diferentes, como no exemplo abaixo

    payment = PagSeguro::PaymentRequest.new

    payment.reference = order
    #payment.notification_url = notifications_url
    payment.redirect_url = cart_url
    payment.sender = {
      name: current_user.name,
      email: current_user.email
    }
    # @cart.each do |product|
    payment.items << {
      id: 1,
      description: 'Teste',
      amount: 10.0
    }
    # end
    response = payment.register
  end

  def payment_params
    params.require(:payment).permit(:method)
  end
end