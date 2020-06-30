

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception


  include Pundit

  # Pundit: white-list approach.

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
    class FederationParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    @params.permit(:sign_up, keys: [:name, :location, :affiliation_price])
  end
  end

    class UserParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    @params.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :nationality, :gender])
    end
  end
  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^profiles$)/
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :nationality, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :nationality, :gender])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location, :affiliation_price])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location, :affiliation_price])
  end
# ANDRE
#     def devise_parameter_sanitizer
#       if resource_class == User
#         UserParameterSanitizer.new(User, :user, params)
#       elsif resource_class == Federation
#         FederationParameterSanitizer.new(Federation, :federation, params)
#       else
#         super # Use the default one
#       end
#     end
end
