class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ActionView::Helpers::TextHelper

  def load_cart
    @cart = Cart.new(session[:cart])
  end
  before_action :load_cart

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def authorize
    redirect_to login_path, alert: "Not authorized" if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_categories
    @categoryindex = Category.all
  end

  def admin?
    current_user.admin? if !current_user.nil?
  end

  helper_method :current_categories
  helper_method :current_user
  helper_method :admin?
end
