class Current < ActiveSupport::CurrentAttributes
  attribute :account, :user
  attribute :request_id, :user_agent, :ip_address, :twilio

  resets { Time.zone = nil }

  def user=(user)
    super
    self.account ||= user.account
  end

  def user
    super.presence || Guest.new
  end
end

