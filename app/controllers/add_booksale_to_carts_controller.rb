class AddBooksaleToCartsController < ApplicationController
  	before_action :authenticate_user!
	def update
		@booksale = Booksale.find_by id: params[:id]
		if @booksale.present?
			id_booksale = @booksale.id
			quantity_booksale = params[:quantity]
			@hash_content = current_cart.content
			if @hash_content.nil?
				byebug
				@hash_content ={"#{id_booksale}": quantity_booksale}			
			elsif @hash_content.has_key?("#{id_booksale}")&& params[:cart_identy].nil?
	
				@old_quantity = current_cart.content["#{id_booksale}"]
				@hash_content[:"#{id_booksale}"] = quantity_booksale.to_i + @old_quantity.to_i
			else

				@hash_content[:"#{id_booksale}"] = quantity_booksale
			end
			byebug
			current_cart.update!(content: @hash_content, user_id: current_user.id)
			@quantity = current_cart.content["#{id_booksale}"]

			 render json:  {
			    "success": true,
			     "value": [{
			       "quantity": @quantity,
			       "success": "ok",
			       "code": "200"       
			     }]
			}
				 	  
		 else
		 	render json:  {
			     "success": false,
			     "errors": [{
			       "message": "Vui long chon phan loai san pham"   
			     }]
			}

		 end
	end

	def destroy
		id_booksale = params[:id]
		@hash_content = current_cart.content.reject!{|key, value| key == "#{id_booksale}"}
		if @hash_content.empty?
			@hash_content =  nil
		end
		current_cart.update!(content: @hash_content)
		flash.now[:success] = "san pham xoa thanh cong "
		render json: {   
	      current_cart:  current_cart
      	}, status: :ok 
	end
end
