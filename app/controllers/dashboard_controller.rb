class DashboardController < ApplicationController
  before_action :load_company, only: [:index ]
  def index
  end

end