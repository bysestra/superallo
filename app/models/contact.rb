class Contact < ApplicationRecord
  include Properties, Nameable, Searchable

  belongs_to :account
  has_many :calls, foreign_key: :callee_id, inverse_of: :callee
  has_many :callers, through: :calls, source: :creator
end
