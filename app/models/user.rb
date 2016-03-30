class User < ActiveRecord::Base

	def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	    user.credentials = auth["credentials"]["token"]
	    user.secret = auth["credentials"]["secret"]
	  end
	end 

	def twitter
		@client ||= Twitter::REST::Client.new do |config|
		  config.consumer_key        = "2ocneUI3bxKvLbUWlJ95IufvH"
		  config.consumer_secret     = "wMDdkmO35BlzFWQWfwUZ9exblj6ZHv514MnmeciY7UMYTKRMiF"
		  config.access_token        = credentials
		  config.access_token_secret = secret
		end
	end
end
