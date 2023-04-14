class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def load_cart
    session[:cart] = session[:cart].to_a
    @cart = Cart.new(session[:cart])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :name])
  end
end
