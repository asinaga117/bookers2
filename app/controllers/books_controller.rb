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
    
  end
  
  def edit
    @book = Book.find(params[:id])
  end

  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion, :image)
  end
end
