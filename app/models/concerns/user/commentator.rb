module User::Commentator
  extend ActiveSupport::Concern
  
  included do
    has_many :comments, foreign_key: :creator_id, inverse_of: :creator
  end
end
