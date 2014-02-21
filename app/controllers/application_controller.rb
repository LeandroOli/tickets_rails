class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  helper_method :current_user, :user_signed_in?

  protected
  def authenticate
    redirect_to login_url, alert: 'Please log in first' unless user_signed_in?
  end

  def login(user)
    session[:user_id] = user.id
  end

  private
    def load_company
      @company = Company.find_by subdomain:request.subdomain
    end
end
