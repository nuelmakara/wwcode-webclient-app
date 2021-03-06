class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  private

  def authenticate_admin!
    if !current_user || !current_user.role.admin?
      flash[:danger] = "Error: administrator permission required for this url."
      redirect_to '/events'
    end
  end
end
