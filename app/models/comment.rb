class Comment < ApplicationRecord
	include PublicActivity::Model
	tracked owner: ->(controller, model){controller && controller.current_user}
	belongs_to :user
	belongs_to :cmt_duty, polymorphic: true
	validates :content, presence: true, length: {maximum: 1000}
end
