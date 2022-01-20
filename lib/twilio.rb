require 'twilio-ruby'

module TwilioControls

account_sid = ENV['SMS_ACCOUNT_SID']
auth_token = ENV['SMS_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

@from = '+15855083599' # Your Twilio number
to = '+16474469950' # The mobile number the text will be sent to

  def self.send_sms(to_phone_number, message)
  @client.messages.create(
    from: @from,
    to: to_phone_number,
    body: message
  )
  end

end