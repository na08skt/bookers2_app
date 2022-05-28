class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @book_new = Book.new
    @user_new = User.new
    @users = User.all
  end



  def show
    # 特定のuser
    @user = User.find(params[:id])
    # ↓新規投稿よう
    @book_new = Book.new
    # 特定userのbooks
    @books = @user.books



  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:profile] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end


  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
