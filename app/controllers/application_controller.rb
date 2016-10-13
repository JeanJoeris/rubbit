class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :refresh_if_necessary

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def refresh_if_necessary
    if current_user && current_user.updated_at.to_i + 3600 < Time.now.to_i
      RedditOAUTHService.refresh_token(current_user)
    end
  end
end
