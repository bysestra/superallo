class CustomField < ApplicationRecord
  belongs_to :account, default: -> { Current.account }

  validates :label, :variant, presence: true

  class << self
    def label_for(name:)
      select(:label).find_by(name: name).label
    end
  end
end
