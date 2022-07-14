class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def show
    @users = User.all
    @books = Book.where(user_id:current_user.id)
    @user = current_user
    @book_new = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book_new = Book.new
    @books = Book.all
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name,:introduction,:image)
  end

end
