class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(User.params)
    @user.user_id = current_user.id
    if @user.saved
      redirect_to home_path
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end


  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
