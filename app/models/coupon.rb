class Coupon < ApplicationRecord
  belongs_to :user, optional: true
  has_many :coupon_logs
 
  def assign_coupon_to_user(user, coupon)
    coupon = Coupon.find(coupon.id)
    CouponLog.create(user_id: user.id, coupon_id: coupon.id)
  end
end
