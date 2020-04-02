module TwilioCallbacks
  extend ActiveSupport::Concern

  included do
    skip_before_action :verify_authenticity_token, :ensure_account_request_path_prefix, :authenticate_user!
  end
end
