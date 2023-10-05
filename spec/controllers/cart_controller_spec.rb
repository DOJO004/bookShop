require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe '折價券計算' do
    it '使用折價券(百分比)' do
      coupon = Coupon.create(name: '九折券', discount: 0.9)
      @total_price = 500
      discount = coupon.discount
      @discount_price = controller.send(:calculate_discount_price, @total_price, discount)
      result_price = @total_price - @discount_price
      expect(result_price).to eq(450)
    end  

    it '使用折價券(折扣金額)' do
      coupon = Coupon.create(name: '六百元折價券', discount: 600)
      @total_price = 500
      discount = coupon.discount
      @discount_price = controller.send(:calculate_discount_price, @total_price, discount)
      result_price = @total_price - @discount_price
      if result_price < 0
          result_price = 0
      end
      expect(result_price).to eq(0)
    end
  end
end
