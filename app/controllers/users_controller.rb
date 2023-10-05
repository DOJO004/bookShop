class UsersController < ApplicationController
  
  def select_coupon
    if current_user
      @coupons = current_user.usable_coupons
    else
      redirect_to cart_path, notice: '登入享有優惠券喔!'
    end
  end 
end
