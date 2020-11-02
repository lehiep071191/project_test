class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
      @comment = Comment.new(cmt_duty_id: params[:cmt_duty_id], cmt_duty_type: params[:cmt_duty_type], user_id: params[:user_id], content: params[:content])
    if @comment.save!
      render json:{
      	data_comment: render_to_string(@comment)
      }, status: :ok
    end
  end

  def destroy
  	@comment.destroy!
  end



  private
  def comment_params
    params.require(:comment).permit(:cmt_duty_id, :cmt_duty_type, :user_id, :content)
  end

  def set_comment
    @comment = Comment.find_by id: params[:id]
  end
end
