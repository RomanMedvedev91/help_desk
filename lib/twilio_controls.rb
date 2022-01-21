require 'twilio-ruby'

module TwilioControls

  def send_sms(to_phone_number, message)
  
      account_sid = ENV['SMS_ACCOUNT_SID']
      auth_token = ENV['SMS_AUTH_TOKEN']
      
      @client = Twilio::REST::Client.new( account_sid, auth_token)
      
      @from = '+15855083599' # Your Twilio number
      to = '+16474469950' # The mobile number the text will be sent to
    
      @client.messages.create(
        from: @from,
        to: "+1#{to_phone_number}",
        body: message
      )
      end

end