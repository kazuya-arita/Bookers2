class BooksController < ApplicationController
  def index
   @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @user
  end  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end  
  
end
