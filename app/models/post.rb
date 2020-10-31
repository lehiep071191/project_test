class Post < ApplicationRecord
	belongs_to :user
	belongs_to :book
	validates :content, presence: true
	validates :title, presence: true
	validates :user_id, presence: true
	validates :book_id, presence: true
end

