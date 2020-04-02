class CustomField < ApplicationRecord
  belongs_to :account

  validates :label, :variant, presence: true
end
