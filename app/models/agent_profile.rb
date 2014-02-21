class AgentProfile < ActiveRecord::Base
  belongs_to :company

  def agent?
    true
  end

  def root_path
    Rails.application.routes.url_helpers.root_path
  end
end
