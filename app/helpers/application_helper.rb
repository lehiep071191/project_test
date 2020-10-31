module ApplicationHelper
	def full_title(page_title = '')
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
	def options_for_book
		Book.all.pluck( :title,:id)
	end		
end
