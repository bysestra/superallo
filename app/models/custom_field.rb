class CustomField < ApplicationRecord
  belongs_to :account, default: -> { Current.account }

  validates :label, :variant, presence: true
end
