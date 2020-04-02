class Contact < ApplicationRecord
  include Properties, Nameable

  belongs_to :account
end
