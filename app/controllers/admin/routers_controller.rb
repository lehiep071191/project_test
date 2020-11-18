class Admin::RoutersController < Admin::ApplicationController
	def index
		@router = Router.new 
		@routers = Router.all
	end	
	def new
		@router = Router.new 
	end
	def create
		@router = Router.new(router_params)
		if @router.save!
			redirect_to admin_routers_path
		end	
	end	 
	private
	def router_params
		params.require(:router).permit(:name, :latitude, :longitude, :address, :description)
	end	
end	
