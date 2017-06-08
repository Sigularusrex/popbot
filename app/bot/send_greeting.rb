# app/bot/send_greeting.rb


require "facebook/messenger"
include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe(access_token: Rails.application.secrets.bot_access_token)
Bot.on :message do |message|
  puts "got your message!"
end