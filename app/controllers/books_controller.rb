class BooksController < ApplicationController
  protect_from_forgery :except => [:destroy]
  before_action :correct_user, only: [ :edit, :update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      @books = Book.all
    　@users = User.all
    　@current_user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    # @user = User.find(params[:id])
    @current_user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @error = @book
    @current_user = current_user
  end

  def update
    @book = Book.find(params[:id])
    @current_user = current_user
    @error = @book
    if @book.update(book_params)
      redirect_to book_path(params[:id]), notice: 'You have updated book successfully.'
    else
      render :edit
    end

  end

  def index
    @books = Book.all
    @users = User.all
    @current_user = current_user
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      @book = Book.find(params[:id])
      @user = User.find(@book.user_id)
      @current_user = current_user
      render :show, notice: 'You filed to delete the book.'
    end
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def correcut_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
end
