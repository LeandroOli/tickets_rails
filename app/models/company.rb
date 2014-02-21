class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true

end
