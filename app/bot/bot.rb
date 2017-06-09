# app/bot/bot.rb
# this file contains the bot logic for receiving and sending a message
# all other processing is done in services or responses
require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["ACCESS_TOKEN"])

require "menu.rb"


# Sends the response to a respond_to object (either a message or a postback)
# Responses are put in an array to handle multiple response from
# various responders
# @response Array
# @respond_to postback
def respond(response, respond_to)
  response.each do |r|
    respond_to.typing_on
    respond_to.reply(r)
  end
end


# Retrieves messages sent bt the user.
# postback payload is equal to a response
# if payload isn't found, delegates to ReadError response
Bot.on :postback do |postback|
  postback.mark_seen

  user = FetchUser.new(postback).call
  response = PostbackProcessor.new(postback, user).call

  #send response
  respond(response, postback)

  postback.typing_off #For persistency
end


# Retrieves messages sent bt the user.
# Currently no messages are being handled, so Message Processor is
# delegating straight to MessageReadError response
Bot.on :message do |message|
  message.mark_seen
  # Returns a user object
  user = FetchUser.new(message).call
  #prepare response
  response = MessageProcessor.new(message).call

  # send response
  respond(response, message)

  message.typing_off #For persistency
end




