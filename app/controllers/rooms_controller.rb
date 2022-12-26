class RoomsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_q

  def index
    @member = current_member
    @rooms = Room.all
  end

  def new
    @member = current_member
    @room = Room.new
  end

  def create
    @member = current_member
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "登録が完了しました"
      redirect_to rooms_path
    else
      flash[:alert] = "登録できませんでした"
      render :new
    end
  end

  def show
    @member = current_member
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @results = @q.result
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :adress, :room_img)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
