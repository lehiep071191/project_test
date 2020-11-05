class PagesController < ApplicationController
	def index
		@activities = PublicActivity::Activity.order("created_at desc").take(4)
	end	
end
