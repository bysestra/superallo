class Twilio::Outgoing::CallsController < ApplicationController
  include TwilioCallbacks

  def create
    respond_to do |format|
      format.any(:html, :xml) { render xml: twilio_response }
    end
  end

  private

  def twilio_response
    Twilio::TwiML::VoiceResponse.new do |r|
      dial.number call_params.fetch(:callee_phone_number, '')
      r.append(dial)
    end.to_s
  end

  def dial
    @dial ||= dial = Twilio::TwiML::Dial.new(
      caller_id: '+15136854579',
      record: 'record-from-ringing-dual',
    )
  end

  def call_params
    params.require(:outgoing_call).permit(:callee_phone_number)
  end
end
