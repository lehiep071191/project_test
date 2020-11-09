class Comment < ApplicationRecord
	include PublicActivity::Model
	tracked owner: ->(controller, model){controller && controller.current_user}
	after_create_commit {CommentBroadcastJob.perform_later(Comment.count, self)}
	belongs_to :user
	belongs_to :cmt_duty, polymorphic: true
	validates :content, presence: true, length: {maximum: 1000}
end
