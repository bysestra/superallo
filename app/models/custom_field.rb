class CustomField < ApplicationRecord
  include Accountable

  validates :label, :variant, presence: true

  # TODO: Use inflector in the condition lambda, like with .env.test?
  validates :choices, presence: true, if: -> (field) { %w(dropdoown multiple).include? field.variant  }

  class << self
    def label_for(name:)
      select(:label).find_by(name: name).label
    end
  end

  def to_partial_path
    "custom_fields/#{variant}"
  end
end
