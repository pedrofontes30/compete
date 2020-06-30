class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @competitions = policy_scope(Competition)

    @competitions = Competition.all

  end

  def show
    @competition = Competition.find(params[:id])
  end
  def new
    @competition = Competition.new
    authorize @competition
  end
  def create
    @competition = Competition.new(competition_params)
    authorize @competition
    @competition.federation = current_federation
    @competition.save!
    redirect_to competition_path(@competition)
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :address, :date, :description, :prize, :registration_deadline, :registration_price)
  end
end
