class TagsController < BaseController

  def new
    @tweet = Tweet.find(params[:tweet_id])
    @tag = @tweet.tags.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.transaction do
      @tag = Tag.find_or_create_by!(tag_params)
      @tag.tweet_tags.create!(tweet: @tweet)
    end
    redirect_to tweet_path(@tweet)
    # can't use .save here
  rescue
    render :new
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
