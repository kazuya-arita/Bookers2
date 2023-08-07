class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."  
    redirect_to book_path(@book.id) 
    end
  end
  
  def index
   @books = Book.all
   @user = current_user
   @book = Book.new
  end
  
  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
  end  
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     flash[:notice] = "You have updated book successfully."  
     redirect_to book_path(book.id)
    end 
  end  
  
  def destroy
    book_show = Book.find(params[:id])
    book_show.destroy
    redirect_to user_path(current_user.id)
  end  
    
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end  
  
end
