class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.now[:notice] = "Logged in!"
      redirect_to user_path(user)
    else
      flash.now[:alert] = "Email ou senha inválidos"
      render 'new'
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end