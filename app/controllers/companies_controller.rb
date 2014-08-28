class CompaniesController < ApplicationController
  skip_before_filter :check_subdomain, only: [:index]
  before_filter :authentiacte_user
  def index
  	@companies = Company.all
    #binding.pry
  end

  def new
  end

  def show
  	@company = Company.find_by_id!(params[:id])
    #@company = Company.find_by_domain!(request.subdomain)
  end

  def edit
  end

  protected
  def authentiacte_user
    if user_signed_in?
      if current_user.user_role == "admin"
        redirect_to admin_companies_path
      end
    end
  end
end
