class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :phone, :position, :resume, :role, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :phone, :position, :resume, :role, :password, :current_password)}
          end

    private

    def after_sign_in_path_for(resource)
        pages_dashboard_path
    end


end
