class CartController < ProfileController
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
    @payment = Payment.new(user_id: current_user.id) 
    @payment.method = payment_params[:method]
    
    if pag_seguro
      # Handle a successful save.
      redirect_to  pag_seguro.redirect_url
    else
      render 'show', notice: 'Erro ao efetuar pagamento!'
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

    #payment.reference = order
    #payment.notification_url = notifications_url
    #payment.redirect_url = processing_url

    @cart.each do |product|
      payment.items << {
        id: product.id,
        description: product.name,
        amount: 10
      }

    end

    response = payment.register

    byebug
  end

  def payment_params
    params.require(:payment).permit(:method)
  end
end