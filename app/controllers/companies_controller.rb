class CompaniesController < ApplicationController
  layout "pages"

  before_filter :authenticate

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if current_user.associate_company(@company)
      redirect_to dashboard_index_url(subdomain: @company.subdomain), notice: "Company successfully created!"
    else
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :subdomain)
  end

end