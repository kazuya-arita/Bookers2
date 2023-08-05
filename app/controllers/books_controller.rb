class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id) 
  end
  
  def index
   @books = Book.all
  end
  
  def show
    @book_show = Book.find(params[:id])
    @user = @book_show.user
    @book = Book.new
  end  
  
  def edit
    @book = Book.find(params[:id])
    @book.update
    redirect_to book_path(@book.id)
  end
  
  def destroy
    book_show = Book.find(params[:id])
    book_show.destroy
    redirect_to user_path(current_user.id)
  end  
    
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end  
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end  
  
  
end
