class CartsController < ApplicationController
  before_action :set_books_in_cart, only: [:show, :apply_coupon]

  def show
    @total_price = session[:cart][:total_price]
    discount = session[:cart]["coupon"].to_f
    @discount_price = calculate_discount_price(@total_price, discount)
    @result_price = @total_price - @discount_price
    if @result_price < 0 
      @result_price = 0
    end
  end

  def destroy
    clear_cart
    redirect_to cart_path, notice: '購物車已清空。'
  end

  def add
    book_id = params[:id]
    increment_cart(book_id)
    redirect_to books_path, notice: '成功添加到購物車'
  end

  def apply_coupon
    @coupon_id = params[:coupon_id].to_i
    session[:coupon_id] = params[:coupon_id].to_i
    @coupon = Coupon.find_by(id: @coupon_id)

    if @coupon
      find_coupon = CouponLog.where(user_id: current_user.id, coupon_id: @coupon_id)
      find_coupon.update(state: 'used')
      session[:cart][:coupon] = @coupon.discount
      coupon = Coupon.find(find_coupon.first.coupon_id)
      coupon.increment!(:count)
      redirect_to cart_path, notice: '折價卷已成功套用。'
    else
      redirect_to cart_path, alert: '折價卷代碼無效。'
    end
  end

  def cancle_coupon
    session[:cart].delete("coupon")
    redirect_to cart_path, notice: '已取消折價卷'
  end

  private

  def set_books_in_cart
    books_in_cart = fetch_books_in_cart
    calculate_total_price(books_in_cart)
  end

  def fetch_books_in_cart
    book_ids_in_cart = session[:cart] || {}
    @books_in_cart = []
    book_ids_in_cart.each do |book_id, quantity|
      book = Book.find_by(id: book_id)
      if book
        sub_total = book.price * quantity
        @books_in_cart << { book: book, quantity: quantity, sub_total: sub_total }
      end
    end
    @books_in_cart
  end

  def calculate_total_price(books_in_cart)
    if session[:cart].nil?
      session[:cart] = {}
    end
    total_price = books_in_cart.sum { |item| item[:sub_total] }
    session[:cart][:total_price] = total_price
  end

  def calculate_discount_price(total_price, discount)
    if discount > 0 && discount < 1
      total_price - total_price * discount
    elsif discount >= 1
      discount
    else
      0
    end
  end

  def clear_cart
    session.delete(:cart)
    session.delete(:total_price)
    session.delete(:discount)
  end

  def increment_cart(book_id)
    session[:cart] ||= {}
    session[:cart][book_id] ||= 0
    session[:cart][book_id] += 1
  end
end
