class Federation::HeatsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_federation!
  # def create
  #   competition_division = CompetitionDivision.find(params[:competition_division_id])
  #   registrations = Registration.where(competition_division: competition_division).find([params[:winners]])
  #   competition_division.create_heats(registrations)
  #   redirect_to competition_path(competition_division.competition)
  # end

  def update
    @heat = Heat.find(params[:id])
    authorize @heat
    user = User.find(params[:user])
    competition_division = @heat.competition_division
    competition_division.update_heat(user, @heat)
    redirect_to competition_path(params[:competition_id], query: @heat.competition_division.id)
  end
end
