class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @error = @user
    @current_user = current_user
  end

  def update
    @user = User.find(params[:id])
    @error = @user
    if @user.update(user_params)
      redirect_to user_path(params[:id]), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def show
    # @users = User.all
    @user = User.find(params[:id])
    @books = @user.books
    @current_user = current_user
    @book_new = Book.new
  end

  def index
    @users = User.all
    @current_user = current_user
    @book_new = Book.new
    @books = Book.all
    @error = @book_new
  end
  
  


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
