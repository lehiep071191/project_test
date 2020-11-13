module ApplicationHelper
	include Pagy::Frontend
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
	def next_link
		@book.chapters.paginate(page: params[:page], per_page: 1)
	end	
	def load_activity
	 @activities = PublicActivity::Activity
	end	
	def pagination_options
	  {
	    renderer: DropPagination::LinkRenderer,
	    previous_label: '<i class="icon icon-hand-left"></i>',
	    next_label: '<i class="icon icon-hand-right"></i>',
	    class: 'pagination row-fluid',
	  }
	end
	
end
