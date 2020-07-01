class Users::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    @params.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :nationality, :gender])
  end
end
