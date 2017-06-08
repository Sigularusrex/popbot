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
    get_sender_profile(@message.sender)
    create_user(@message.sender['id'], get_sender_profile(@message.sender))
  end

  private
  def create_user(id, name)
    User.where(:facebook_id => id).first_or_create(:first_name => name)
  end

  def get_sender_profile(sender)
    request = HTTParty.get(
        "https://graph.facebook.com/v2.6/#{sender['id']}",
        query: {
            access_token: ENV['ACCESS_TOKEN'],
            fields: 'first_name'
        }
    )

    request.parsed_response["first_name"]
  end
end