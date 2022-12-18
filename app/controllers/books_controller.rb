class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new (book_params)
#    if @book.save
 #   redirect_to book_path(@book.id)
 #   flash[:notice] = "book was successfully created..."
 #   end
  end

  def show
  end
end
