class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :cmt_duty, polymorphic: true
	validates :content, presence: true, length: {maximum: 1000}
end
