class Federation::CompetitionsController < ApplicationController
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

  end

  def update
    @competition = Competition.find(params[:id])
    authorize @competition
    @competition.update(competition_params)
    redirect_to competition_path(params[:id])
  end

end
