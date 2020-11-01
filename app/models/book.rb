class Book < ApplicationRecord
	has_many :posts
	has_many :rates, as: :rate_duty
	validates :description, presence: true, length: { maximum: 140 }
	validates :title, presence: true, length: {maximum: 100}	
	enum category: {"18+" => 0, "kid" => 1, "techology" => 2, "manga" => 3, "kungfu" => 4,
		"love" => 5, "Science_Fiction" => 6, "orther" => 7}
end
