class CustomField < ApplicationRecord
  include Accountable

  validates :label, :variant, presence: true

  # TODO: Use inflector in the condition lambda, like with .env.test?
  validates :choices, presence: true, if: -> (field) { field.variant == 'dropdown'  }

  class << self
    def label_for(name:)
      select(:label).find_by(name: name).label
    end
  end
end
