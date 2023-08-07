class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end  
  
  
  def edit
    @user = User.find(params[:id])
  end  
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def book_params
   params.require(:book).permit(:title, :opinion)
  end 
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end  
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end 
  end 
  
end
