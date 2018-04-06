class StaticPagesController < ApplicationController

  MICROPOST_DEFAULT_PER_PAGE = 7

  def home
    if logged_in?
      @micropost = current_user.microposts.build 
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: MICROPOST_DEFAULT_PER_PAGE)
    end
  end

  def help
  end

  def about
  end
end
