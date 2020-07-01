class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @competitions = policy_scope(Competition).order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
        competitions.name ILIKE :query \
        OR competitions.address ILIKE :query \
        OR federations.name ILIKE :query \
      "
      @competitions = Competition.joins(:federation).where(sql_query, query: "%#{params[:query]}%")
    else
      @competitions = Competition.all
    end
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
