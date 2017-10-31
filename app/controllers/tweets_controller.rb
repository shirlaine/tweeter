class TweetsController < BaseController

  before_action :prepare_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = current_user.tweets
    @user = current_user
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def new
    @tweet = current_user.tweets.new
    @tag = @tweet.tags.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      flash[:notice] = 'Your tweet was created!'
      redirect_to tweet_path(@tweet)
    else
      flash[:alert] = 'Your tweet was not saved!'
      render :new
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = 'Your tweet was updated!'
      redirect_to tweet_path(@tweet)
    else
      flash[:alert] = 'Your tweet was not updated!'
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    flash[:notice] = 'Your tweet has been deleted!'
    redirect_to tweets_path
  end

  private

  def prepare_tweet
    @tweet = current_user.tweets.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, tags_attributes: [:name])
  end

  # def tag_params
  #   params.require(:tag).permit(:name)
  # end

end
