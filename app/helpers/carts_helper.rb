module CartsHelper

 def render_cart
 	if current_user.is_there_payment?
 		 render :partial => 'carts/show_cart' 
 	else
 		 render :partial => 'carts/blocked' 
 	end


 end



end
