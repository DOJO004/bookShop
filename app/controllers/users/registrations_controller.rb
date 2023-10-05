class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   @user.role = 'client'
   if @user.save
    sign_in @user
    set_coupon
    redirect_to root_path, notice: '成功加入會員'
   else
    flash.now[:notice] = 'check field'
    render :new
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_coupon
    CouponLog.create(user_id: current_user.id, coupon_id: 5)
    CouponLog.create(user_id: current_user.id, coupon_id: 6)
  end
end
