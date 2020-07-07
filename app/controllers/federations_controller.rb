class FederationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @federations = policy_scope(Federation).order(created_at: :desc)
  end

  def show
    @federation = Federation.find(params[:id])
    authorize @federation
    @competitions = Competition.where(federation: @federation)
    @affiliation = Affiliation.new(federation: @federation)
    @affiliated = current_user.present? ? Affiliation.where(user: current_user, federation: @federation) != [] : nil
    if params[:query].present?
      @user_federation_division_scores = UserFederationDivisionScore.where(federation: @federation, division: params[:query]).order(:score).reverse
    end
  end
end
