class Twilio::EventsController < ApplicationController
  include CallScoped, TwilioCallbacks

  def create
    @call.update!(updated_call_attributes)
    render nothing: true
  end

  private

  def updated_call_attributes
    attributes = {}
    attributes[:duration_in_seconds] = params['CallDuration'] if params.fetch('CallDuration', false).present?
    attributes[:recording_url] = params['RecordingUrl'] if params.fetch('RecordingUrl', false).present?
    attributes
  end
end
