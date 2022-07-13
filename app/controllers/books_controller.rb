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
      @user = current_user
      @book_new = Book.new
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(params[:id])

  def index
    @books = Book.all
    @users = User.all
    if  @user = current_user
      @book_new = Book.new
    else
      redirect_to root_path
    end
     @book = Book.find(params[:id])
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
