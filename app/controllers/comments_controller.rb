class CommentsController < ApplicationController
  def create
    meme = Meme.find(params[:meme_id])
    @comment = meme.comments.create(comment_params)
    #@comment.user = current_user
    if @comment.save
      redirect_to meme_path(meme)
    else
      p @comment.errors
      flash[:alert] = "There was a problem creating the comment"
      redirect_to meme_path(meme)
    end
  end

  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end
