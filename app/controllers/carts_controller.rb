class CartsController < ApplicationController
  before_action :authenticate_user!
  layout 'profile_layout'




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
    
     @payment = Payment.new( user_id:current_user.id) 
     @payment.method = payment_params[:method]
      # Not the final implementation!
    if @payment.save
      # Handle a successful save.
      redirect_to  user_dashboard_path
    else
      render 'show'
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


  def payment_params
    params.require(:payment).permit(:method)
  end
end