class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  include Pundit::Authorization
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:notice] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

end
