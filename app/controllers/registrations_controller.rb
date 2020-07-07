class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
    @registration = Registration.new
    authorize @registration
    @divisions = CompetitionDivision.where(competition: @competition)
  end

  def create
    @registration = Registration.new(registration_params)
    authorize @registration
    @registration.user = current_user
    @registration.save!
    @registration.competition_division.create_heats
    UserFederationDivisionScore.where(user: current_user, federation: @registration.competition_division.competition.federation).first_or_create
    redirect_to competition_path(params[:competition_id])
  end

  def show
    @registration = Registration.new(registration_params)
    authorize @registration
    @affiliated = current_user.present? ? Affiliation.where(user: current_user, federation: @competition.federation) != [] : nil
  end

  private

  def registration_params
    params.require(:registration).permit(:competition_division_id)
  end
end
