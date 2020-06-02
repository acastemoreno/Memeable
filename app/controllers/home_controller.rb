class HomeController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def index
    @dates = Meme.preload(:owner).order('created_at ASC').group_by { |m| m.created_at.to_date }
  end

  def categories
    @categories = Category.preload(:memes)
  end

  def popular
    @memes = Meme.preload(:owner).order('votes_count DESC')
  end

  def profile
    
  end
end
