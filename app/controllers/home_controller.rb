class HomeController < ApplicationController
  before_action :set_q, only: [:index]
  
  def index
    @member = current_member
  end
  
  private
  
  def set_q
    @q = Room.ransack(params[:q])
  end

end
