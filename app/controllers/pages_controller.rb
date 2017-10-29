class PagesController < BaseController

  def index
    @user = current_user
    @tweets = current_user.tweets.order(id: :desc)
  end

end
