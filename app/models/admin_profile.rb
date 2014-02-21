class AdminProfile < ActiveRecord::Base
  def admin?
    true
  end

  def root_path
    Rails.application.routes.url_helpers.admin_root_path
  end
end
