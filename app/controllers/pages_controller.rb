class PagesController < BaseController

  def index
    @user = current_user
    @tweet = Tweet.new
    @tag = @tweet.tags.new
    @feed = Tweet.where(user_id: @user.leaders.ids << @user.id)
  end

end
