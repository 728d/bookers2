class BooksController < ApplicationController
  before_action :a, only:[:edit, :update]
  
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user_info = @book.user
    @book_new = Book.new
  end

  def index
    @books = Book.all
    @user_info = current_user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user_info = current_user
      render :index
    end
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
   else
     render :edit
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, method: :delete
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

def a
     book = Book.find(params[:id])
     b = book.user
     if b != current_user
       redirect_to books_path
     end
end
end