class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    # finds user with session data and stores it if present
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    # allows only logged in user
    redirect_to sign_in_path, alert: 'You must be signed in' if Current.user.nil?
  end

  def restricted_admin_access!
    redirect_to root_path, alert: 'You must be an admin' unless Current.user.admin? || Current.user.superadmin?
  end

  def restricted_superadmin_access!
    redirect_to root_path, alert: 'You must be a superadmin' unless Current.user.superadmin?
  end
end
