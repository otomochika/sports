class TweetsController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]

def index
    
    if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @tweets = Tweet.joins(:user).where("tweet_name LIKE ? OR menue LIKE ?", "%#{search}%", "%#{search}%")
      else
        @tweets = Tweet.all
      end
end

 def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet_name, :menue, :detail)
  end


end