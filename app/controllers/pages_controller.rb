class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @competitions = Competition.all.order(created_at: :desc).take(6)
  end

  def profile
    @registrations = current_user.registrations
  end
end
