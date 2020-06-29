class AffiliationsController < ApplicationController
  def new
    @federation = Federation.find(params[:federation_id])
    @affiliation = Affiliation.new
  end
end
