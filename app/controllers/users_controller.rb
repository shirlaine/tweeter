class UsersController < BaseController

  def index
    @users = User.all
    @tweets = Tweet.all
  end

  def leaders
    @users = User.all
    @following = current_user.leaders
  end

  def followers
    @followers = current_user.followers
  end

  def show
    @user = User.find(params[:id])
    @usertweets = @user.tweets.order(id: :desc)
    @following = @user.leaders
    @followers = @user.followers
  end

end
