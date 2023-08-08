class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "You have created book successfully."  
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     @user = current_user
     render :index  
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
    is_matching_login_user
    @book = Book.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."  
     redirect_to book_path(@book.id)
    else
     render :edit  
    end 
  end  
  
  def destroy
    book_show = Book.find(params[:id])
    book_show.destroy
    redirect_to books_path
  end  
    
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end  
  
  def is_matching_login_user
   book = Book.find(params[:id])
   unless book.user.id == current_user.id
    redirect_to books_path
   end 
  end   
  
end
