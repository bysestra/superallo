class Call::Incineratable::Incineration
  def initialize(call)
    @call = call
  end

  def run
    if possible?
      incinerat_call
    end
  end

  def possible?
    failed? && due?
  end

  private

  def failed?
    @call.initiated? && !@call.completed?
  end

  def due?
    @call.updated_at < Call::Incineratable::INCINERATABLE_AFTER.ago.end_of_day
  end

  def incinerat_call
    @call.destroy
  end
end
