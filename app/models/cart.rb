class Cart < ApplicationRecord
	has_many :cart_booksales
	has_many :booksale, through: :cart_booksales
	serialize :content, JSON
	belongs_to :user

end
