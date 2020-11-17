namespace :job do
	desc "TODO"
  task mailminute: :environment do
    WelcomeWorker.perform_async WelcomeWorker::MAIL_MINUTE
  end
end
