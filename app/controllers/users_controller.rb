class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  end

  def show_login
  end

  def login
    user = User.find_by_email_and_authenticate email: params[:user][:email], password: params[:user][:password]
    if user
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to :root
    else
      flash[:error] = "Login failed"
      render :show_login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end
end
