class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :clean_up, only: [:profile]
  def home
    @competitions = Competition.all.order(created_at: :desc).take(6)
  end

  def profile
    @registrations = current_user.registrations
    @affiliations = current_user.affiliations
    @competitions = Competition.all
  end

  private

  def clean_up
    @affiliations = current_user.affiliations
    @affiliations.each do |affiliation|
      if 365 - affiliation.days_since_registration <= 0
        affiliation.destroy
      end
    end
  end
end
