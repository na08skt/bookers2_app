class BooksController < ApplicationController
before_action :collect_user, only: [:edit, :update, :destroy]

  def new
    @book_new = Book.new
  end

  def index
    # もう触らない
    @book_new = Book.new
    @user_new = User.new
    @books = Book.all
  end

  def create
    @books = Book.all
    @user_new = User.new
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:newbook] = "You have created book successfully."
      redirect_to book_path(@book_new)
    else
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @book_destroy = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:edit] = "You have updated book successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book_destroy = Book.find(params[:id])
    @book_destroy.destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def collect_user
    @user = Book.find(params[:id]).user
    if @user.id != current_user.id
      redirect_to books_path
    end
  end
end
