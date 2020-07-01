class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :update, :destroy]

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

end
