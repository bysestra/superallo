module Accountable
  extend ActiveSupport::Concern

  included do
    belongs_to :account, default: -> { Current.account }
  end
end
