class Twilio::Outgoing::CallsController < ApplicationController
  include TwilioCallbacks

  before_action :set_call

  def create
    respond_to do |format|
      format.any(:html, :xml) { render xml: twilio_response }
    end
  end

  private

  def set_call
    @call ||= Call.find_by!(id: params[:id])
  end

  def twilio_response
    Twilio::TwiML::VoiceResponse.new do |response|
      response.dial(dial_params) { |dial| dial.number(@call.to_number, number_params) }
    end.to_s
  end

  def number_params
    {
      status_callback: twilio_call_events_url(@call),
      status_callback_event: %w( answered completed ).join(' '),
    }
  end

  def dial_params
    {
      caller_id: @call.from_number,
      record: 'record-from-ringing-dual',
      recording_status_callback: call_recording_url(@call),
      # recording_status_callback_event: 'complete',
    }
  end
end
