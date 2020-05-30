class MemesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params.merge(owner: current_user))
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new
    end
  end

  private
  def meme_params
    params.require(:meme).permit(:title, :url_source, :type, :category_id, :owner)
  end
end
