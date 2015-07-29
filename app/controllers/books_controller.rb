class BooksController < ApplicationController

  def index
      books = Book.all

      if rating = params[:rating]
        books = books.where(rating: rating)
      end
      render json: books, status: 200
  end

  def create
    book = Book.new(book_params)
    if book.save
        render json: book, status: 201, location: book
    end
  end

  private

    def book_params
      params.require(:book).permit()
    end



end
