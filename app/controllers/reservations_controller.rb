class ReservationsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_q

  def index
    @member = current_member
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @member = current_member
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
  end

  def create
    @member = current_member
    @reservation = Reservation.new(reservation_params)
    @reservation.member_id = current_member.id
      if @reservation.save
        flash[:notice] = "予約が完了しました"
        redirect_to reservation_path(@reservation)
      else
        flash[:alert] = "予約できませんでした"
        @reservations = Reservation.all
        @rooms = Room.all
        render :index
      end
  end

  def show
    @member = current_member
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :number, :member_id, :room_id)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
