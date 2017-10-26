class PagesController < BaseController

  def index
    @user = current_user
    @tweets = @user.tweets.all
  end

end
