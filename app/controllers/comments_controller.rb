class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
      @comment = Comment.new(cmt_duty_id: params[:cmt_duty_id], cmt_duty_type: params[:cmt_duty_type], user_id: params[:user_id], content: params[:content])
      # @comment = current_user.comments.build comment_params
    if @comment.save!
      # respond_to do |format|
      #   format.html{ redirect_to @comment.cmt_duty}
      #   format.js
      # end  
      render json:{
      	data_comment: render_to_string(@comment)
      }, status: :ok
    end
  end

  def destroy
  	@comment.destroy!
    respond_to do |format|
      format.html{ redirect_to cmt.duty }
      format.js
    end  
  end



  private
  def comment_params
    params.require(:comment).permit(:cmt_duty_id, :cmt_duty_type, :user_id, :content)
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end
