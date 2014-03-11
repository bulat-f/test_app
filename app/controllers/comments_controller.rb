class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :admin_user,         only: :destroy

  apply_simple_captcha

  def create
    if user_signed_in?
      @comment = current_user.comments.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    if @comment.valid_with_captcha? && @comment.save
      flash[:success] = 'Post commented successful'
    else
      flash[:warning] = 'Comment did not commented'
    end
    redirect_to post_path(comment_params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    post_id = @comment.post_id
    if @comment.destroy
      flash[:success] = "Comment deleted"
      redirect_to post_path(post_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
