class Federations::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    @params.permit(:sign_up, keys: [:name, :location, :affiliation_price])
  end
end
