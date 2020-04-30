class CallsController < ApplicationController
  include ContactScoped

  before_action :set_call, only: %i[show update]
  skip_before_action :set_contact, only: %i[show update]

  # layout 'contact'

  def create
    @call = @contact.calls.create!(creator: Current.user)
    
    respond_to do |format|
      format.html { redirect_to call_url(@call) }
      format.js
    end
  end

  def show
    @contact = @call.callee
  end

  def update
    @call.update!(call_params)

    respond_to do |format|
      format.any(:html, :js) { redirect_to call_url(@call) }
    end
  end

  private

  def set_call
    @call ||= Call.find(params[:id])
  end

  def call_params
    params.require(:call).permit(:external_id, :status)
  end
end
