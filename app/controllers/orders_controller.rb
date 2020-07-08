class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])

    if params[:federation_id]
      affiliation = Affiliation.new(federation_id: params[:federation_id])
      affiliation.user = current_user
      affiliation.save
      @order.update(state: 'paid', affiliation: affiliation)
    end
    if params[:competition_division_id]
      registration = Registration.new(competition_division_id: params[:competition_division_id])
      registration.user = current_user
      registration.price = registration.competition.registration_price
      registration.save!
      registration.competition_division.create_heats
      if UserFederationDivisionScore.where(user: current_user, federation: registration.competition_division.competition.federation) == []
        UserFederationDivisionScore.create!(user: current_user, federation: registration.competition_division.competition.federation, division: registration.competition_division.division)
      end
      @order.update(state: 'paid', registration: registration)
    end
    authorize @order
  end
end
