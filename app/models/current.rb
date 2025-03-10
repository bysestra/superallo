class Current < ActiveSupport::CurrentAttributes
  attribute :account, :user
  attribute :request_id, :user_agent, :ip_address, :twilio
  attribute :survey

  resets { Time.zone = nil }

  def user=(user)
    super
    self.account = user.account
    self.survey  = user.account&.surveys&.first || Survey.new(name: "Temporary")
  end

  def user
    super.presence || Guest.new
  end
end

