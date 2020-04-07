class Call::IncinerationJob < ApplicationJob
  queue_as :incineration

  def self.schedule(call)
    set(wait: Call::Incineratable::INCINERATABLE_AFTER).perform_later(call)
  end

  def perform(call)
    call.incinerate
  end
end
