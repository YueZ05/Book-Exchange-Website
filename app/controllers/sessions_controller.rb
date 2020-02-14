class SessionsController < ApplicationController
  def new
  end

  # Create a new session for user
  def create
    # Find user using the params hash to authenticate users
    user = User.find_by(email: params[:session][:email].downcase)


    # If it's an authenticated user, log them in, remember them, and redirect to user's page
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
 
    else
      # Create an error message that flashes for this session only.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  # Destroys session, logs out user (if they're logged in), redirects them to home page
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
