class BooksController < ApplicationController
    before_action :authenticate_user!, except:[:index, :show]

    def index

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

    end

    def destroy

    end

    private

    def book_params
      params.require(:book).permit(:title, :author, :overview, :price, :stocks, :publisher, :publish_date, :isbn)
    end
end
