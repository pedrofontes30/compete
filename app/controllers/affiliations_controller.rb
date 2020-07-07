class AffiliationsController < ApplicationController

  def new
    @federation = Federation.find(params[:federation_id])
    @affiliation = Affiliation.new(federation_id: params[:federation_id])
    authorize @affiliation
  end

  def create
    @competition = Competition.find(params[:affiliation][:competition_id])
    @affiliation = Affiliation.new(federation_id: params[:federation_id])
    @affiliation.user = current_user
    authorize @affiliation
    @affiliation.save!
    redirect_to competition_path(@competition)
  end
end
