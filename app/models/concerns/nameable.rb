module Nameable
  extend ActiveSupport::Concern

  included do
    has_person_name
  end
end
