module CartHelper

  def render_cart
    if current_user.is_there_payment?
      render :partial => 'cart/show_cart' 
    else
      render :partial => 'cart/blocked' 
    end
  end
  
end
