class Recipe < ActiveRecord::Base
	include PublicActivity::Model
	tracked
	attr_accessor  :email
	belongs_to :user
	has_many :comments, dependent: :destroy
end	