class CouponController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to coupon_index_path, notice: '新增成功!'
    else
      flash.now[:notice]='請檢查欄位'
      render :new 
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def coupon_params 
    params.require(:coupon).permit( :name, :coupon_type, :discount, :expiration_date)
  end
end
