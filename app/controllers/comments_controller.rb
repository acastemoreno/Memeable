class CommentsController < ApplicationController
  def show
    meme = Meme.find(params[:id])
  end
end
