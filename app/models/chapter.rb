class Chapter < ApplicationRecord
	acts_as_paranoid
	belongs_to :book 
	validates :title, presence: true
	validates :body, presence: true
	validates :chapter_number, presence: true
	scope :order_by_chapter,->{ order(chapter_number: :asc) }
end
