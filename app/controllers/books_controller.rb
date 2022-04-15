class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    @books = Book.all
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end


  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @user = User.find(@books.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion, :image)
  end
end
