class Account < ApplicationRecord
  has_many :calls
  has_many :comments
  has_many :contacts
  has_many :custom_fields
  has_many :users
  has_many :surveys

  def custom_fields_permitted_params
    custom_fields.map(&:permitted_param)
  end
end
