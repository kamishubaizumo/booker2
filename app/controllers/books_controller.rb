
class BooksController < ApplicationController

   before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def new
  end

    def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice]= "Book was successfully created."
    else
    @books = Book.all
    render :index
    end
    end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def edit
    @book = Book.find(params[:id])


  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfully updated..."
    else
    render :edit
    end


    end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end


  private

    def book_params
        params.require(:book).permit(:title,  :body)
    end

  

      def is_matching_login_user
      @book = Book.find(params[:id])
    user_id = @book.user.id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
      end

end
