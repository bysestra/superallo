module Contact::Properties
  extend ActiveSupport::Concern

  included do
    store :properties
  end

  def custom_fields
    CustomField.where("name IN (?)", properties.keys)
  end
end
