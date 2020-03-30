class User < ApplicationRecord
  include Accountable, Authenticatable, Nameable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
end
