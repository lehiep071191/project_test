class EmailHelloJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
    	email_hello user
    end	
  end
  private
  def email_hello user
    UserMailer.hello(user).deliver_now
  end
end
