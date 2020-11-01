class Post < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :rates, as: :rate_duty
	validates :content, presence: true
	validates :title, presence: true
	validates :user_id, presence: true
	validates :book_id, presence: true
end

