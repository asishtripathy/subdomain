class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_company
  protect_from_forgery with: :exception
  #before_action :check_subdomain
  before_action :set_cart_id

  def check_subdomain
  	redirect_to root_path if current_company.blank?
  end

  def current_company
  	@company ||= get_company_by_subdomain
  end

  protected

  def get_company_by_subdomain
  	Company.find_by_domain(request.subdomain)	
  end
  def set_cart_id
    if session['id'].nil?
      session['id'] = Time.now.to_i
    end
  end
  def currentcart
    @cart = Cart.where(:session_id => session['id'] ).first
    #binding.pry
    if @cart.nil?
        @cart = Cart.create!(:session_id => session['id'] )
    end    
    @cart
  end
end
