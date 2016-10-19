class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def create
    @company = Company.create(company_params)
  end

  def company_params
    params.require(:company).permit(:name)
  end
end
