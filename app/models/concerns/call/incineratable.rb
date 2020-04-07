module Call::Incineratable
  extend ActiveSupport::Concern

  INCINERATABLE_AFTER = 30.days

  included do
    after_commit :incinerate_later, on: :create
  end

  def incinerate
    Incineration.new(self).run
  end

  private

  def incinerate_later
    Call::IncinerationJob.schedule(self) if initiated?
  end
end
