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

  def choices=(values)
    processed = case values
      when String then values.split(',').map(&:strip).join(',')
      when Array then values.map(&:strip).join(',')
      else values
    end

    super processed
  end

  def to_partial_path
    "custom_fields/#{variant}"
  end

  def permitted_param
    case variant.to_sym
      when :multiple then { name.to_sym => [] }
      when :string then name.to_sym
      else name.to_sym
    end
  end
end
