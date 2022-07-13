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
    @books = Book.all
    if @user = current_user
      @book_new = Book.new
    else
      redirect_to root_path
    end
     @book = Book.find(params[:id])
  end
  
  def index
    @users = User.all
    if @user = current_user
      @book_new = Book.new
      @books = Book.all
      @book = Book.find(params[:id])
    else
      redirect_to root_path
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
  
end
