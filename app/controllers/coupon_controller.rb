class CouponController < ApplicationController
  before_action :set_coupon, only: [:edit, :update, :destroy]
  
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def create
    @coupon = Coupon.new(coupon_params)
    generate_coupon_code
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
    if @coupon.update(coupon_params)
      redirect_to coupon_index_path, notice: '修改成功!'
    else
      flash.now[:notice]='請檢查欄位'
      render :edit
    end
  end

  def destroy
    @coupon.destroy
    redirect_to coupon_index_path, notice: '刪除成功!'
  end

  private

  def coupon_params 
    params.require(:coupon).permit( :name, :coupon_type, :discount, :expiration_date)
  end

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def generate_coupon_code
    coupon_code = Date.today.strftime('%Y%m%d') + rand(100...999).to_s
    @coupon.code = coupon_code
  end

end
