class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
    @books = Book.all
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render "edit"
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user)
    else
      @users = User.all
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
