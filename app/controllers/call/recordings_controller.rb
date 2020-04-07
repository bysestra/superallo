class Call::RecordingsController < ApplicationController
  include CallScoped, TwilioCallbacks

  def create
    @call.update!(call_recording_attributes)
    render nothing: true
  end

  private

  def call_recording_attributes
    attributes = {}
    attributes[:recording_url] = params['RecordingUrl'] if params.fetch('RecordingUrl', false).present?
    attributes
  end
end
