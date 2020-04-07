class User < ApplicationRecord
  include Accountable, Authenticatable, Nameable, Avatarable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :calls, foreign_key: :creator_id, inverse_of: :creator

  def outgoing_call_number
    '+15136854579'
  end
end
