class UsersController < BaseController

  def leaders
    @users = User.all
    @following = current_user.leaders
  end

  def followers
    @followers = current_user.followers
  end

  def show
    @user = User.find(params[:id])
    @following = @user.leaders
    @followers = @user.followers
  end

end
