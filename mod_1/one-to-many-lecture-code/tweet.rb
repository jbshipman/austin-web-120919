class Tweet
  attr_reader :message, :user

  @@all = []

  def initialize(message, user)
    @message = message
    @user = user

    #save tweet to Tweet.all
    @@all << self
  end


  def user
    @user
  end

  def username
    @user.username
  end

  def self.all
    @@all
  end

end
