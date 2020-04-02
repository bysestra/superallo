class Twilio::CapabilitiesController < ApplicationController
  def create
    render plain: Twilio::Capability.generate(params[:page])
  end
end
