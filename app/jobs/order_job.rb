class OrderJob < ApplicationJob
  queue_as :default

  def perform order
   OrderMailer.order(order).deliver_now
  end
end
