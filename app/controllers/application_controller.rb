class ApplicationController < ActionController::Base
  include SetCurrentUser, SetTwilioClient, SetLocale
  include Authentication, LetterAvatar::AvatarHelper, Paginatable

  before_action :masquerade_user!
end
