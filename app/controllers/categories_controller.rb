class CategoriesController < ApplicationController
  def index
  	@categories = Book.send(params["category"]).paginate(page: params[:page], per_page: 10)
  end
end
