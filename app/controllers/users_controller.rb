class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user.id)
   else
     render :edit
   end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
  def correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user)
    end
  end
  
end
