class RatesController < ApplicationController
	before_action :set_rate, only: [:edit, :update]
	def new
		@rate = Rate.new
	end	
	def create
	@rate = Rate.new(rating: params[:rating], user_id: params[:user_id],rate_duty_id: params[:rate_duty_id], rate_duty_type: params[:rate_duty_type])
	if @rate.save!
		render json:{
			data_rate: @rate
		}, status: :ok
	end	

	def edit
	end	

	def update
		if @rate.update!(rating: params[:rating], user_id: params[:user_id],rate_duty_id: params[:rate_duty_id], rate_duty_type: params[:rate_duty_type])
			render json:{
				data_rate: @rate
			}, status: :ok	
		end
	end	

	end	
	private
	def rate_params
		params.require(:rate).permit(:rating, :user_id,
					 :rate_duty_id, :rate_duty_type)
	end
	def set_rate
		@rate = Rate.find_by id: params[:id]
		if @rate.nil?
			flash[:danger] = "rate not found" 
			redirect_back(fallback_location: root_path)
		end		
	end		

end
