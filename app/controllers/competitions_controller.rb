class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :update, :destroy, :new, :create]
  # before_action :authenticate_federation!, only: [:new, :create]

  def index
    @competitions = policy_scope(Competition).order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
        competitions.name ILIKE :query \
        OR competitions.address ILIKE :query \
        OR federations.name ILIKE :query \ "
      @competitions = Competition.joins(:federation).where(sql_query, query: "%#{params[:query]}%")
    else
      @competitions = Competition.all
    end
  end

  def show
    @competition = Competition.find(params[:id])
    authorize @competition
    @affiliated = current_user.present? ? Affiliation.where(user: current_user, federation: @competition.federation) != [] : nil

    @divisions = @competition.competition_divisions
    if params[:query].present?
      @divisions = @divisions.joins(:division).where("divisions.name ILIKE ?", "%#{params[:query]}%")
    else
      @divisions = []
    end
    # @registrations = @competition.competition_divisions.select{|competition_division| competition_division.registrations}
    @registrations = @competition.registrations

    @federation = @competition.federation
    @affiliation = Affiliation.new(federation: @federation)

  end

  def new
    @competition = Competition.new
    authorize @competition
  end

  def create
    @competition = Competition.new(competition_params)
    @competition.federation = current_federation
    authorize @competition
    raise
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
    params.require(:competition).permit(:name, :address, :date, :description, :prize, :registration_deadline, :registration_price, competition_divisions_attributes: [:id, :competition_id, :division_id])
  end

  def pundit_user
    if federation_signed_in?
      @federation = current_federation
    elsif user_signed_in?
      @user = current_user
    end
  end

end
