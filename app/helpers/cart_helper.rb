module CartHelper

  def render_cart
    if current_user.is_there_payment
      render :partial => 'cart/show_cart' 
    else
      render :partial => 'cart/blocked' 
    end
  end
  def render_payment_form
    if current_user.payment.method == 'Depósito bancário'
      render :partial => 'cart/partial_show_deposito' 
    else current_user.payment.method  == 'Em espécie(presencial)'
      render :partial => 'cart/partial_show_presencial' 
    end
  end
end
