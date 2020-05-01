class Comment < ApplicationRecord
  include Accountable

  belongs_to :creator, class_name: 'User', default: -> { Current.user }
  belongs_to :commentable, class_name: 'Contact', inverse_of: :comments

  scope :reverse_chronologically, -> { order(created_at: :desc) }

  has_rich_text :content

  validates :content, presence: true
end
