class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @competitions = policy_scope(Competition).order(created_at: :desc)
  end

  def show
    @competition = Competition.find(params[:id])
    authorize @competition
    (@affiliated = (Affiliation.where(user: current_user, federation: @competition.federation) == [])) if current_user.present?
  end
end
