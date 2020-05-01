class CustomField < ApplicationRecord
  include Accountable

  validates :label, :variant, presence: true

  class << self
    def label_for(name:)
      select(:label).find_by(name: name).label
    end
  end
end
