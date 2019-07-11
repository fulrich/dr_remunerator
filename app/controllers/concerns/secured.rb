module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in?
  end

  def logged_in?
    redirect_to '/' unless session[:userinfo].present?
  end
end
