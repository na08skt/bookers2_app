class HomeController < ApplicationController
  def top
    @book_new = Book.new
    @user_new = User.new
  end

  def home
    @user = current_user
    @book_new = Book.new
    @books = Book.all
    @books = @books.user
  end

  def about
  end



end
