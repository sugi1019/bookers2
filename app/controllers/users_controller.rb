class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end
end


private

def user_params
  params.require(:user).permit(:name, :introduction)
end