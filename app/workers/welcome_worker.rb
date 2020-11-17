class WelcomeWorker
  include Sidekiq::Worker

  MAIL_MINUTE= 1

  def perform action
    case action
    when MAIL_MINUTE

      User.all.each do |user|
        send_email user
      end
    end
  end

  private
  def send_email user
    UserMailer.hello(user).deliver_now
  end
end
