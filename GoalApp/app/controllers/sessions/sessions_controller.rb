class SessionsController < ApplicationController
  def current_user
    @current_user ||= User.find_by(params[:id])
  end

  def ensure_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
  def logged_in?
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!current_user.nil?
    #bang bang
  end

  def log_in(user)
    user.reset_session_token
    @current_user = user
    session[:session_token] = user.session_token
  end

  def log_out
    current_user.reset_session_token
    @current_user = nil
    session[:session_token] = nil
  end
end
