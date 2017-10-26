class PagesController < BaseController

  def index
    @user = current_user
    @tweets = Tweet.all
  end

end
