class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :destroy]

  def index
    @competitions = policy_scope(Competition).order(created_at: :desc)
  end

  def show
    @competition = Competition.find(params[:id])
    authorize @competition
    @affiliated = current_user.present? ? Affiliation.where(user: current_user, federation: @competition.federation) != [] : nil
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
    redirect_to competitions_path
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :address, :date, :description, :prize, :registration_deadline, :registration_price, competition_divisions_attributes: [:id])
  end
end
