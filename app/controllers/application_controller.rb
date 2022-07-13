class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
       admins_works_path
    else
       user_path(current_user.id)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
       admin_session_path
    else
       root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
