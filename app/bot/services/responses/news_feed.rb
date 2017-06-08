# MessageProcessor handles an incoming responce and parses to the required responder object
class NewsFeed < MessageProcessor

  def initialize(message, user)
    @message = message
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    return [{
         text: 'Enjoy your news feed'
     }]
  end

  #stub for expanding on responses
  def accepted_responses
    #
  end
end




