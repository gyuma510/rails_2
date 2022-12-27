class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_q


  def account
    @member = current_member
  end

  def profile
    @member = current_member
  end

  def update
    @member = Member.find(params[:id])
      if @member.update(profile_params)
        flash[:notice] = "更新しました"
        redirect_to members_profile_path
      else
        flash.now[:alert] = "更新失敗しました、再入力してください"
        render members_profile_path
      end
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

  private

  def profile_params
    params.require(:member).permit(:profile_image_id, :membername, :profile)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
