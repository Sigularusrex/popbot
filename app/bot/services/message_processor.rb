
# MessageProcessor handles an incoming responce and parses to the required responder object
class MessageProcessor
  def initialize(message)
    @message = message
  end

  #Sends message the correct object for response
  def call
    #sending default message until message handling is added
    begin
      @message.payload.constantize.new(@message).call
    rescue
      MessageReadError.new().call
    end

  end

  private


end