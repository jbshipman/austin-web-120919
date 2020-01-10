class User

attr_reader :username

  def initialize(username)
    @username = username
  end

  def tweets
    Tweet.all.select do |tweet|
      tweet.user == self
    end
  end

  def post_tweet(message)
    # create a new Tweet
    binding.pry
    tweet = Tweet.new(message, self)
    #add that tweet to the user's collection of Tweets
    add_tweet(tweet)
  end

  private

  def add_tweet(tweet)
    self.tweets << tweet
  end


end
