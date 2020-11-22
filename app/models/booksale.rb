class Booksale < ApplicationRecord
	has_many :cart_booksales
	has_many :cart, through: :cart_booksales
	has_many :order_details
	validates :price, presence: true
	validates :name, presence: true
	validate :discount_check
	enum category: {"chord" => 0, "kid" => 1, "techology" => 2, "manga" => 3, "kungfu" => 4,
		"love" => 5, "Science_Fiction" => 6, "orther" => 7}

	def discount_price
	    if self.discount.present?
	        self.price -= self.price* self.discount / 100
	    else
	       self.price 
    	end
  	end	
  	private 
  	def discount_check
  		if discount < 0 || discount > 100
  			errors.add(:discount, 'trong khoang tu 0 den 100')
  		end 
  	end		

end
