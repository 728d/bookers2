class UsersController < ApplicationController
  before_action :a, only:[:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users =User.all
    @user_info = current_user
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully"
     redirect_to user_path(current_user.id)
   else
     render :edit
   end
  end

  def edit
     @user = User.find(params[:id])
  end
   private

   def a
     @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user.id)
     end
   end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
