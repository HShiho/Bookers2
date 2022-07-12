class UsersController < ApplicationController
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(params[:id])
  end

  def show
    @users = User.all
    @user = current_user
    @book_new = Book.new
    @books = Book.all
  end
  
  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
    @books = Book.all
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
end
