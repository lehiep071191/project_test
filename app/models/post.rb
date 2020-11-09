class Post < ApplicationRecord
	acts_as_paranoid
	belongs_to :user
	belongs_to :book
	has_many :rates, as: :rate_duty, dependent: :destroy
	has_many :comments, as: :cmt_duty, dependent: :destroy
	validates :content, presence: true
	validates :title, presence: true
	validates :user_id, presence: true
end

