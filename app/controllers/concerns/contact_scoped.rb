module ContactScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_contact
  end

  private

  def set_contact
    @contact ||= Current.account.contacts.find(params[:contact_id])
  end
end
