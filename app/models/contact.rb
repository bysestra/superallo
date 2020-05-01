class Contact < ApplicationRecord
  include Accountable, Avatarable, Properties, Nameable, Searchable, Commentable

  has_many :calls, foreign_key: :callee_id, inverse_of: :callee
  has_many :callers, through: :calls, source: :creator

  validates :first_name, :last_name, :phone_number, presence: true

  def events
    (calls.all.includes(:creator, :callee).to_a + comments.all.includes(:creator, :commentable).to_a)
      .flatten.sort_by(&:created_at).reverse
  end
end
