class ApplicationController < ActionController::Base
  include SetCurrentUser, SetTwilioClient
  include Authentication, LetterAvatar::AvatarHelper, Paginatable

  before_action :masquerade_user!
end
