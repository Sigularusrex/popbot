# MessageProcessor handles an incoming responce and parses to the required responder object
class MyMusic < MessageProcessor

  def initialize(message, user)
    @message = message
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    return [{
                text: 'Sorry, am not connecting to Spotify yet'
            }]
  end

  #stub for expanding on responses
  def accepted_responses
    #
  end

end



