class FederationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @federations = policy_scope(Federation).order(created_at: :desc)
  end

  def show
    @federation = Federation.find(params[:id])
    authorize @federation
    @competitions = Competition.where(federation: @federation)
  end
end
