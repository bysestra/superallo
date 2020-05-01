class User < ApplicationRecord
  include Accountable, Authenticatable, Nameable, Avatarable, Commentator

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :calls, foreign_key: :creator_id, inverse_of: :creator

  def outgoing_call_number
    '+15136854579'
  end

  concerning :Personable do
    def title
      nil
    end
  end
end
