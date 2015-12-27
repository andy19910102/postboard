class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:info] = "Hello, #{current_user.name}! You've logged in."
        redirect_to root_path
    else
      flash[:danger] = "Fail to logged in. Please try again."
      redirect_to login_path
    end

  end

  def destroy
    flash[:info] = "You've logged out."
    session[:user_id] = nil
    #when the user log out, set the session[:user_id] to nothing inside.
    redirect_to root_path
    #then direct to the root_path.
  end

end