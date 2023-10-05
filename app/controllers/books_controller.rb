class BooksController < ApplicationController
    before_action :authenticate_user!, except:[:index, :show]
    before_action :find_book, only: [:edit, :update, :destroy]

    def index
      @books = Book.all.order(id: :desc)
    end

    def show
    end

    def new
      @book = Book.new
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        redirect_to root_path, notice: 'cteate sucess'
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @book.update(book_params)
        redirect_to root_path, notice: '編輯成功!'
      else
        flash.now[:notice] = '請檢查欄位'
        render :edit
      end
    end

    def destroy
      @book.destroy
      redirect_to root_path, notice: '刪除成功!'
    end

    private

    def book_params
      params.require(:book).permit(:title, :author, :overview, :price, :stocks, :publisher, :publish_date, :isbn)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
