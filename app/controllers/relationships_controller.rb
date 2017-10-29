class RelationshipsController < BaseController

  def create
    @user = User.find(params[:follower_id])
    @relationship = current_user.follow!(@user)
    flash[:alert] = "You are now following @#{@user.username}"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    flash[:alert] = "You have unfollowed @#{@user.username}"
    redirect_to user_path(@user)
  end

end
