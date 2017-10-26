class TagsController < BaseController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @tag = @tweet.tags.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tag = @tweet.tags.create(tag_params)
    redirect_to tweet_path(@tweet)
    # can't use .save here
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @tag = @tweet.tags.find_by(params[:tag_id])
  end

  def update
    @tweet = Tweet.find(params[:tweet_id])
    @tag = @tweet.tags.find_by(params[:tag_id])
    if @tag.update(tag_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
