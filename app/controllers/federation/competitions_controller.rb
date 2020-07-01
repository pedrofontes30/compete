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
    redirect_to competition_path(@competition)
  end

  def edit
    @competition = Competition.find(params[:id])
    authorize @competition
  end

  def update
    @competition = Competition.find(params[:id])
    authorize @competition
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
