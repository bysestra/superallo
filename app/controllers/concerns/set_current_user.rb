module SetCurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user, :ensure_account_request_path_prefix, if: :user_signed_in? 
  end

  private

  def set_current_user
    Current.user = current_user
  end

  def ensure_account_request_path_prefix
    unless request.path.include?(Current.account.slug)
      redirect_to after_sign_in_path_for(Current.user.class)
    end
  end
end
