class Federation::CompetitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :authenticate_federation!
  def index
    @competitions = policy_scope(current_federation.competitions).order(created_at: :desc)
  end
end
