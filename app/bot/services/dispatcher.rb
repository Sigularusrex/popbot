class Dispatcher

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


