class HomeController < ApplicationController
  def index
    @dates = Meme.preload(:owner).order('created_at ASC').group_by { |m| m.created_at.to_date }
  end

  def categories
    @categories = Category.preload(:memes)
  end
end
