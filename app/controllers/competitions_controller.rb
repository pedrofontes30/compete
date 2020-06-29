class CompetitionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @competitions = Competition.all

  def show
    @competition = Competition.find(params[:id])

  end
end
