# app/bot/send_greeting.rb


require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: ENV["BOT_ACCESS_TOKEN"])
Bot.on :message do |message|
  puts "got your message!"
end