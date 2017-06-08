# app/bot/bot.rb

require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'

def get_sender_profile(sender)
  request = HTTParty.get(
      "https://graph.facebook.com/v2.6/#{sender['id']}",
      query: {
          access_token: ENV['ACCESS_TOKEN'],
          fields: 'first_name'
      }
  )

  request.parsed_response
end



Facebook::Messenger::Profile.set({
                                     get_started: {
                                         payload: 'GetStarted'
                                     }
                                 }, access_token: ENV['ACCESS_TOKEN'])


Bot.on :message do |message|
  message.mark_seen

  user = FetchUser.new(message).call

  response = MessageProcessor.new(message).call
  #
  response.each do |r|
    message.typing_on
    message.reply(r)
  end

  message.typing_off #For persistency
end


Bot.on :postback do |postback|
  postback.mark_seen

  user = FetchUser.new(postback).call


  puts postback.inspect
  response = PostbackProcessor.new(postback, user).call

  #
  response.each do |r|
    postback.typing_on
    postback.reply(r)
  end

  postback.typing_off #For persistency
end




