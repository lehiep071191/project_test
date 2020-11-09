class Admin::RestoresController < Admin::ApplicationController
  def index
  	@restores = Book.only_deleted
  end

  def new
  end

  def show
  end
  def update
  	@restore = Book.restore(params[:id], recursive: true)
  		respond_to do |format|
  			format.html{ redirect_to admin_restores_path }
  			format.js
  		end	
  end	
end
