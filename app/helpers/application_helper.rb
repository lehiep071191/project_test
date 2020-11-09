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
	def comments_tree_for comments, cmt_duty, comment_new
		safe_join(comments.map do |comment, nested_comments|
		  render(comment, cmt_duty: cmt_duty,
		    comment_new: comment_new) + tree(nested_comments, cmt_duty)
		end)
	end

	def tree nested_comments, cmt_duty
		unless nested_comments.empty?
		  content_tag :div,
		    comments_tree_for(nested_comments, cmt_duty, Comment.new), class: "replies"
		end
	end
	def load_activity
	 @activities = PublicActivity::Activity
	end	
	
end
