class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.member_id = current_member.id
    @reservation.price = @reservation.sum_of_price
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render "new"
    end
  end

  def show
    @member = current_member
    @reservation = Reservation.find(params[:id])
    @room = Room.find(params[:room_id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :number)
  end
end
