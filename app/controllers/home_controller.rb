class HomeController < ApplicationController
  def index
    @memes = Meme.preload(:owner).order('created_at ASC').group_by { |m| m.created_at.to_date }
  end
end
