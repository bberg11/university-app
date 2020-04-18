class LoginsController < ApplicationController
  def new
  end

  def create
    user = Student.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully signed in"
      redirect_to student_path(user)
    else
      flash.now[:danger] = "We could not find a profile matching the provided credentials"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out"
    redirect_to request.referer
  end
end
