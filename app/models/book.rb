class Book < ApplicationRecord
	acts_as_paranoid
	has_many :posts
	has_many :chapters
	accepts_nested_attributes_for :chapters, reject_if: :all_blank, allow_destroy: true
	has_many :rates, as: :rate_duty, dependent: :destroy
	has_many :comments, as: :cmt_duty, dependent: :destroy
	validates :description, presence: true, length: { maximum: 140 }
	validates :title, presence: true, length: {maximum: 100}	

	enum category: {"v-+18+" => 0, "kid" => 1, "techology" => 2, "manga" => 3, "kungfu" => 4,
		"love" => 5, "Science_Fiction" => 6, "orther" => 7}
	def self.to_csv
		attributes = %w{ title, author, description }
		CSV.generate do |csv|
			csv << attributes
			all.each do |book|
				csv << book.attributes.values_at(*attributes)
			end		
		end	
	end	
end
