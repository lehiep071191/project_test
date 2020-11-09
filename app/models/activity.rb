class Activity < PublicActivity::Activity

	before_save :check_hello
	private
	def check_hello
		byebug
	end
end	