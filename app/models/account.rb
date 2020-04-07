class Account < ApplicationRecord
  has_many :custom_fields
  has_many :calls
  has_many :contacts
  has_many :users
end
