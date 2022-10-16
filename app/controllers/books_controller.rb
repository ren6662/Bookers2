class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     redirect_to books_path
     flash[:notice] = "You have created book successfully."
    else
      render :new
    end
  end

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
  flash[:notice] = "You have updated booksuccessfully."
   redirect_to book_path(@book.id)
   else
     render :edit
   end
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :image, :caption)
  end
end
