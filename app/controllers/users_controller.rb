class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "book was successfully updated..."
  else
    render :edit
  end

end

  def destroy
  @book = Book.find(params[:id])
  @book.destroy
  redirect_to book_path

  end

private
  def user_params
    params.require(:user).permit(:name, :introduction ,:profile_image)
  end


      def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
      end



end

