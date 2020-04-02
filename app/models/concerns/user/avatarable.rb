module User::Avatarable
  extend ActiveSupport::Concern

  included do
    require 'letter_avatar/has_avatar'
    include LetterAvatar::HasAvatar
  end
end
