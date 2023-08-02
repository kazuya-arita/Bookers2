class UsersController < ApplicationController
  def index
  end  
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id) 
  end
  
  def edit
  end  
  
  private
  
  def book_params
   params.require(:book).permit(:title, :opinion)
  end 
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end 
  end 
  
end
