# app/bot/bot.rb

require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

require "menu.rb"


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




