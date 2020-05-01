class Call < ApplicationRecord
  include Accountable, Directable, Statusable, Incineratable

  belongs_to :creator, class_name: 'User', inverse_of: :calls
  belongs_to :callee, class_name: 'Contact', inverse_of: :calls

  has_one_attached :recording

  validates :from_number, :to_number, presence: :true
  before_validation :infer_to_and_from_numbers, on: :create

  scope :reverse_chronologically, -> { order(created_at: :desc) }

  concerning :Eventable do
    def content
      ApplicationController.render(partial: 'calls/content', locals: { call: self })
    end
  end

  def duration_in_seconds
    super.presence || 0
  end

  private

  def infer_to_and_from_numbers
    assign_attributes(
      to_number: callee.phone_number,
      from_number: creator.outgoing_call_number
    )
  end
end
