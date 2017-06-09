class Dispatcher

  # Currently not used. I stubbed it out for future dev, but scope doesn't call for it just yet.
  # Sending happens in the bot.rb file
  def initialize(bot, message)
    @message = message
    @bot = bot
    @user = user
  end

  def call
    deliver
  end

  private

  def deliver
    Bot.deliver({
                    recipient: {
                        id: @user.facebook_id
                    },
                    message: message
                }, access_token: ENV['ACCESS_TOKEN'])
  end


end


