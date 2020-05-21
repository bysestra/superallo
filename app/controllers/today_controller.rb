class TodayController < ApplicationController
  def show
    @pagy, @contacts = pagy(Current.account.contacts.follow_up_today)
  end
end
