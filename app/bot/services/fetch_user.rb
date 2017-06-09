#     NOTE, I would usually add this in a main services folder
#     as NewUser would likely be called in the app itself
#     and not just the bot

# Finds or creates and returns a User object
class FetchUser

  # @message [json] JSON object returned from Facebook Messenger
  def initialize(message)
    @message = message
  end

  def call
    user = get_sender_profile(@message.sender['id'])
    puts @message.sender["id"]
    create_user(@message.sender['id'], user['first_name'], user['timezone'])
  end

  def message
    @message
  end

  #Stub for testing Graph API
  def get_facebook_user(id)
    get_sender_profile(id)
  end

  def create_user(id, name, timezone)
    User.where(:facebook_id => id).first_or_create(:first_name => name, :timezone => timezone)
  end

  private

  def get_sender_profile(sender)
    request = HTTParty.get(
        "https://graph.facebook.com/v2.6/#{sender}",
        query: {
            access_token: ENV['ACCESS_TOKEN'],
            fields: 'first_name, timezone'
        }
    )

    request.parsed_response
  end
end