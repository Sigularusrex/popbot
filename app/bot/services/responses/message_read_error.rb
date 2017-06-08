# MessageProcessor handles an incoming responce and parses to the required responder object
class MessageReadError < MessageProcessor

  def initialize()
    #Handle error responses for future learning
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    return [
        attachment: {
            type: 'template',
            payload: {
                template_type: 'button',
                text: "Sorry, I don't understand messages right now.. but I'm getting smarter. \n Try these instead:",
                buttons: [
                    { type: 'postback', title: 'Get Started', payload: 'GetStarted' },
                    { type: 'postback', title: 'Show News Feed', payload: 'NewsFeed' }
                ]
            }
        }
    ]
  end

end