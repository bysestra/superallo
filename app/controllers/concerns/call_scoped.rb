module CallScoped
  extend ActiveSupport::Concern
  
  included do
    before_action :set_call
  end

  private

  def set_call
    @call ||= Call.find(params[:call_id])
  end
end
