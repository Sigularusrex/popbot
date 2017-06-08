# MessageProcessor handles an incoming responce and parses to the required responder object
class ReadError < MessageProcessor

  def initialize()
    #Handle error responses for future learning
  end

  def call
    prepare_response
  end

  private

  def prepare_response
    return [{
                text: 'Something has gone wrong..'
            }]
  end

end