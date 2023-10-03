class CartsController < ApplicationController
  def show
    book_ids_in_cart = session[:cart] || {}
    @books_in_cart = []
    @total_price = 0
  
    if book_ids_in_cart
      book_ids_in_cart.each do |book_id, quantity|
        book = Book.find(book_id)
        sub_total = book.price * quantity
        @books_in_cart << {book: book, quantity: quantity, sub_total: sub_total} if book
        @total_price += sub_total
      end
    end
  end

  def destroy
    session.delete(:cart)
    redirect_to cart_path, notice: '購物車已清空。'
  end

  def add
    book_id = params[:id]
    session[:cart] ||= {}
    session[:cart][book_id] ||=0
    session[:cart][book_id] +=1  
    redirect_to books_path, notice: '成功添加到購物車'  
  end
end
  