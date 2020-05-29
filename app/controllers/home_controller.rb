class HomeController < ApplicationController
  def index
    @memes = Meme.order('created_at DESC').group_by { |m| m.created_at.to_date }
  end
end
