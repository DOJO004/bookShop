require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe "酷踫基本功能" do
    it "新增一張酷踫卷" do 
      coupon = Coupon.create(name: "九折卷", code: "CODE009", amount: 5, discount: 0.9)
      expect(Coupon.count).not_to be 0
    end
    it "酷踫卷可以指定給使用者" do 
      coupon = Coupon.create(name: "九折卷", code: "CODE009", amount: 5, discount: 0.9)
      user = User.create(name: 'kevin', email: '111@111', password: 'password', role:'client')
      coupon.assign_coupon_to_user(user,coupon)
      expect(CouponLog.count).not_to be 0
    end
  end
end
