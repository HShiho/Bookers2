class BooksController < ApplicationController
  def new
      @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        redirect_to books_path
        flash[:notice] = 'You have created book successfully.'
    else
      @books = Book.all
      @users = User.all
      @current_user = current_user
      @book_new = Book.new
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
    @current_user = current_user
  end
  
  def edit
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(params[:id])
  end

  def index
    @books = Book.all
    @users = User.all
    @current_user = current_user
    @book_new = Book.new
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
