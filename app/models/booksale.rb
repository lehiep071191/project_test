class Booksale < ApplicationRecord
	has_many :cart_booksales
	has_many :cart, through: :cart_booksales
	has_many :order_details
	validates :price, presence: true
	validates :name, presence: true
	enum category: {"chord" => 0, "kid" => 1, "techology" => 2, "manga" => 3, "kungfu" => 4,
		"love" => 5, "Science_Fiction" => 6, "orther" => 7}
end
