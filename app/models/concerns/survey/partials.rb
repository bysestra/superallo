module Survey::Partials
  extend ActiveSupport::Concern
  
  def to_partial_path
    return "surveys/#{partial_name}" if partial_exists?
    super
  end

  def partial_exists?
    lookup_context ||= ApplicationController.new.lookup_context
    lookup_context.exists?(partial_name, "surveys", true)
  end
  
  private

  def partial_name
    name.parameterize.underscore
  end
end
