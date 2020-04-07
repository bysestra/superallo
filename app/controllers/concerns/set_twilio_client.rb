module SetTwilioClient
  extend ActiveSupport::Concern
  
  included do
    before_action do
      Current.twilio = Twilio::REST::Client.new(
        Rails.application.credentials.dig(:twilio, :account_sid),
        Rails.application.credentials.dig(:twilio, :auth_token)
      )
    end
  end
end
