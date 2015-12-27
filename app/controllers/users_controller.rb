class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] ="You've registered Successfully."
      redirect_to root_path
      #if registration were done successfully
      #turn back to index page
    else
      flash.now[:danger] = "Error, please try again."
      render 'new'
      #if not, show the form again
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password)
  end
end