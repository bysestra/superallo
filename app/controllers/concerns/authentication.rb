module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  end

  def after_sign_in_path_for(resource)
    "/#{Current.account.slug}"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :account_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
