require 'grackle'

class Tweet < ActiveRecord::Base
	 MY_APPLICATION_NAME = "twitter_toplinks_app"
  
  #Connect to the Twitter API and pull down the latest tweets
  def self.get_latest
    tweets = client.statuses.user_timeline? :screen_name => MY_APPLICATION_NAME # hit the API
    tweets.each do |t|
      created = DateTime.parse(t.created_at)
      # create the tweet if it doesn't already exist
      unless Tweet.exists?(["created=?", created])
        Tweet.create({:content => t.text, :created => created })
       end
    end
  end
  
  private
  def self.client
    Grackle::Client.new(:auth=>{
      :type=>:oauth,
      :consumer_key=>'2ocneUI3bxKvLbUWlJ95IufvH',
      :consumer_secret=>'wMDdkmO35BlzFWQWfwUZ9exblj6ZHv514MnmeciY7UMYTKRMiF',
      :token=>"379278338-9XJpgAM6KbIx8LOG2enXmK8GNxZTeNB08sxQIOve",
      :token_secret=>"JGVTgocuwG4y4C2a3s8Vn7vw4egexEPlVJGCvlAgbhZML"
    })

  end
end
