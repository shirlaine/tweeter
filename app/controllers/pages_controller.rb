class PagesController < BaseController

  def index
    @user = current_user
    @tweets = current_user.tweets.order(id: :desc)
    @leaders = current_user.leaders
    @tweet = Tweet.new
    @tag = @tweet.tags.new
  end

end
