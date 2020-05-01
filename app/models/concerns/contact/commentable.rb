module Contact::Commentable
  extend ActiveSupport::Concern
  
  included do
    has_many :comments, foreign_key: :commentable_id, inverse_of: :commentable
  end
end
