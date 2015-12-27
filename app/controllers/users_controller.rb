class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
      #if registration were done successfully
      #turn back to index page
    else
      render 'new'
      #if not, show the form again
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password)
  end
end