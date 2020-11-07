class Activity < PublicActivity::Activity
	after_create_commit {
	ActivityBroadcastJob.perform_later(@activities.count, self)}
end	