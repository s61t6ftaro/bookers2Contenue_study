class BooksController < ApplicationController
  before_action :correct_book, only: [:edit, :update]
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "successfully"
    else
      @books = Book.all
      render 'index'
    end
  end 

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to book_path
      flash[:notice] = "successfully"
    else
      render 'edit'
    end
  end


private
def correct_book
  book = Book.find(params[:id])
  if current_user != book.user
    redirect_to user_path(current_user)
  end
end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
