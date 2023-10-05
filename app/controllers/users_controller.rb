class UsersController < ApplicationController
  
  def select_coupon
    if current_user
      @coupon_ids = current_user.coupon_logs.pluck(:coupon_id)
      @coupons = Coupon.where(id: @coupon_ids)
    else
      redirect_to cart_path, notice: '登入享有優惠卷喔!'
    end
  end
end
