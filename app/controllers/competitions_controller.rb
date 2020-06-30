class CompetitionsController < ApplicationController
  def show
    @competition = Competition.find(params[:id])
  end
  def new
    @competition = Competition.new
  end
  def create
  end
end
