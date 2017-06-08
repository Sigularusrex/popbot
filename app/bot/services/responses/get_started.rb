# MessageProcessor handles an incoming responce and parses to the required responder object
class GetStarted < PostbackProcessor

  def initialize(message, user)
    @message = message
    @user = user
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    return [{
         text: "Hello, #{@user.first_name}"
     },
     {
         text: 'Hello, 2!'
     }]
  end

  #stub for expanding on responses when reading messages (Not needed for postbacks)
  def accepted_responses
    #
  end
end




