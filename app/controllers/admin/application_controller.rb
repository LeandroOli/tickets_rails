module Admin
  class ApplicationController < ::ApplicationController
    layout "admin"
    before_filter :authenticate
    protect_from_forgery with: :exception

    private

    def authenticate
      redirect_to login_url, alert: 'Please log in first' unless can_admin?
    end

    def can_admin?
      current_user && current_user.admin?
    end
  end
end