module Contact::Properties
  extend ActiveSupport::Concern

  included do
    store :properties
  end
end
