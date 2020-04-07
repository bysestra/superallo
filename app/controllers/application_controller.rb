class ApplicationController < ActionController::Base
  include SetCurrentUser, SetTwilioClient
  include Authentication, LetterAvatar::AvatarHelper

  before_action :masquerade_user!
end
