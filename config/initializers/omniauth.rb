Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '2ocneUI3bxKvLbUWlJ95IufvH', 'wMDdkmO35BlzFWQWfwUZ9exblj6ZHv514MnmeciY7UMYTKRMiF'
  # Twitter::REST::Client.new do |config|
  #   # config.consumer_key = YOUR_CONSUMER_KEY
  #   # config.consumer_secret = YOUR_CONSUMER_SECRET
  #   config.oauth_token = "379278338-9XJpgAM6KbIx8LOG2enXmK8GNxZTeNB08sxQIOve"
  #   config.oauth_token_secret =   "JGVTgocuwG4y4C2a3s8Vn7vw4egexEPlVJGCvlAgbhZML"

  # end
end