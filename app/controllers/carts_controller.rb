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
   
  end

  def add
    
    $redis.sadd current_user_cart, params[:id]
    #render json: current_user.cart_count
    redirect_to :back
  end

  def remove
    $redis.srem current_user_cart, params[:id]
    #render json: current_user.cart_count, status: 200
    redirect_to :back
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end