class AffiliationsController < ApplicationController

  def new
    @federation = Federation.find(params[:federation_id])
    @affiliation = Affiliation.new
  end

  def create
    affiliation = Affiliation.new(federation_id: params[:federation_id])
    affiliation.user = current_user
    affiliation.save!
    redirect_to competitions_path
  end

  # private

  # def affiliation_params
  #   params.require(:affiliation).permit(:federation_id)
  # end
end
