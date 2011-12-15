require 'sinatra'
require 'rest_client'

# This is meant to come from the Heroku config vars
# http://devcenter.heroku.com/articles/config-vars
grove_api_key = ENV['grove_api_key']

get '/' do
  "Hello World!"
end

post '/incoming' do
  # Grove supported params are:
  # service  - Name of the service (displayed in the chat room)
  # message  - The message sent to the chat room (or notification)
  # url      - (Optional) Service URL for the web client
  # icon_url - (Optional) Icon for the service. Similar to a gravatar for a user.
  from    = params[:From]
  body    = params[:Body]
  message = "SMS reply from: #{from} - #{body}"
  service = "Hubot"
  RestClient.post "https://grove.io/api/notice/#{grove_api_key}/", :service => service, :message => message
end
