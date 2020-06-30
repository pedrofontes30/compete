class CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @competitions = policy_scope(Competition)
  end

  def show
    @competition = Competition.find(params[:id])
  end
end
