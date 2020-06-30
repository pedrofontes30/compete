class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @competitions = policy_scope(Competition)

    @competitions = Competition.all

  end

  def show
    @competition = Competition.find(params[:id])
    authorize @competition
  end
end
