class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q

  def index
    @member = current_member
  end

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:membername])
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
