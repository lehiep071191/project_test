class CartsController < ApplicationController
	before_action :set_cart, only: [:update]
	before_action :authenticate_user!
	def index
		if current_cart.content.nil?
			redirect_back fallback_location: current_cart, notice: t("carts.index.notice")
		end
	end	
	def show
	end	
	def update
			quantity_booksale = params[:quantity]
			id_booksale = params[:booksale_id]
			@hash_content = current_cart.content
			if @hash_content.nil?
				@hash_content ={"#{id_booksale}": quantity_booksale}			
			elsif @hash_content.has_key?("#{id_booksale}")&& params[:cart_identy].nil?
				@old_quantity = current_cart.content["#{id_booksale}"]
				@hash_content[:"#{id_booksale}"] = quantity_booksale.to_i + @old_quantity.to_i
			else

				@hash_content[:"#{id_booksale}"] = quantity_booksale
			end
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
				 	  
		
	end

	def destroy
		id_booksale = params[:booksale_id]
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
	private 
	def set_cart
		@cart = current_cart.id
	end	
end
