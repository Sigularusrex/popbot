
# MessageProcessor handles an incoming responce and parses to the required responder object
class PostbackProcessor
  def initialize(message, user)
    @message = message
    @user = user
  end

  #Sends message the correct object for response
  # Returns Array
  def call
    begin
      @message.payload.constantize.new(@message, @user).call
    rescue
      ReadError.new().call
    end
  end

  private


end