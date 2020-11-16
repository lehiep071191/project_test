class WelcomeWorker
  include Sidekiq::Worker

  MAIL_MONTH = 1

  def perform action
    case action
    when MAIL_MONTH
      User.all.each do |user|
        send_email_when_end_month user
      end
    end
  end

  private
  def send_email_when_end_month user
    UserMailer.welcome_email(course).deliver_now
  end
end
