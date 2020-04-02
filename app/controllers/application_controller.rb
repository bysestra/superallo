class ApplicationController < ActionController::Base
  include SetCurrentUser
  include Authentication, LetterAvatar::AvatarHelper

  before_action :masquerade_user!
end
