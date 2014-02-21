class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :password_confirmation, presence: true
  validates :name, presence: true
  delegate :admin?, :root_path, to: :profile

  def associate_company(company)
    if company.save
      profile = AgentProfile.new
      profile.company = company
      profile.company_manager = true
      self.update_attribute(:profile, profile)
      true
    else
      false
    end
  end

  def redirect_path
    if self.profile
      self.profile.root_path
    else
      Rails.application.routes.url_helpers.new_company_path
    end
  end

end
