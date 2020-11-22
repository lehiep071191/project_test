module OrdersHelper
	def total_payment
		@sum = 0
			current_cart.content.each do |key,value|
				booksale= Booksale.find_by id:key
				 @sum += booksale.price*value.to_i
			end
		@sum
	end
end
