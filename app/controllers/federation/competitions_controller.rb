class Federation::CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_federation!
  #skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @competitions = policy_scope(current_federation.competitions).order(created_at: :desc)
  end

  def new
    @competition = Competition.new
    authorize @competition
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.federation = current_federation
    authorize @competition
    @competition.save!
    params[:competition][:competition_divisions_attributes].each do |key, value|
      competition_division = @competition.competition_divisions.build
      competition_division.division_id = value[:division_id]
      competition_division.save
    end
    redirect_to competition_path(@competition)
  end

  def edit
    @competition = Competition.find(params[:id])
    authorize @competition
  end

  def update
    @competition = Competition.find(params[:id])
    authorize @competition
    @competition.update(competition_params)
    unless params[:competition][:competition_divisions_attributes].nil?
      params[:competition][:competition_divisions_attributes].each do |key, value|
        if value[:id]
          competition_division = CompetitionDivision.find(value[:id])
          competition_division.destroy unless value[:_destroy] == 'false'
        else
          competition_division = @competition.competition_divisions.build
          competition_division.division_id = value[:division_id]
          competition_division.save
        end
      end
    end
    redirect_to competition_path(@competition)
  end

  def destroy
    @competition = Competition.find(params[:id])
    authorize @competition
    @competition.destroy
    redirect_to federation_competitions_path
  end

  def pundit_user
    current_federation
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :address, :date, :description, :prize, :registration_deadline, :registration_price, competition_divisions_attributes: [:id])
  end

end
