class Contact < ApplicationRecord
  include Properties

  belongs_to :account
end
