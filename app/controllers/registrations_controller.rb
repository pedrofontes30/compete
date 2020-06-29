class RegistrationsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end
end
