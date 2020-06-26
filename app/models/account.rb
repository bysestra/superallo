class Account < ApplicationRecord
  has_many :calls
  has_many :comments
  has_many :custom_fields
  has_many :users
  has_many :surveys
  has_many :contacts do
    def follow_up_today
      where(follow_up_date: Date.current)
    end
  end

  def custom_fields_permitted_params
    custom_fields.map(&:permitted_param)
  end

  def locale
    super.presence || "en"
  end
end
