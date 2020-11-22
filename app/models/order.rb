class Order < ApplicationRecord
	belongs_to :user
	has_many :order_details
	accepts_nested_attributes_for :order_details
	scope :count_order, -> {where('created_at >=?', 24.hour.ago)}
 	scope :order_by_time, -> (val){order(created_at: :desc) if val == "newest"}
 	scope :status, -> (order_status) {where(order_status: order_status)}
 	enum order_status: {"Awaiting" =>0, "Cancelseller" => 1, "Accepted" => 2, "Processing" => 3,
            "Shipping" => 4, "Delivered" => 5, "Refunded" => 6,"Cancelbuyer"=>7} 	
end
