class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render "new"
    end
  end

  def show
    @member = current_member
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end


  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :adress, :room_img)
  end

end
