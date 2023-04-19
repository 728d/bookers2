class BooksController < ApplicationController
  def new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    book = Book.new
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def update
  end

  def destroy
  end
end
