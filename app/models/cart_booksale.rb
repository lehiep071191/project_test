class CartBooksale < ApplicationRecord
	belongs_to :cart
	belongs_to :booksale
end
