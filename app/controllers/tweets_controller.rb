class TweetsController < BaseController

  before_action :prepare_tweet, only: [:show, :edit, :update, :delete]

  def index
    @tweets = Tweet.all
  end

  def show; end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = 'Your tweet was created!'
      redirect_to tweets_path
    else
      flash[:alert] = 'Your tweet was not saved!'
      render :new
    end
  end

  def edit; end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = 'Your tweet was updated!'
      redirect_to tweets_path
    else
      flash[:alert] = 'Your tweet was not updated!'
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def prepare_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
