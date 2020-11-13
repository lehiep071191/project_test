class Admin::ApplicationController < ActionController::Base
	before_action :require_admin
	include Pagy::Backend
	include  DropPagination
	private
	def require_admin
		redirect_to root_url unless current_user.admin?
	end	
end	