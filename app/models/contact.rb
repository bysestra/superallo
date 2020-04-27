class Contact < ApplicationRecord
  include Avatarable, Properties, Nameable, Searchable

  belongs_to :account
  has_many :calls, foreign_key: :callee_id, inverse_of: :callee
  has_many :callers, through: :calls, source: :creator

  validates :first_name, :last_name, :phone_number, presence: true
end
