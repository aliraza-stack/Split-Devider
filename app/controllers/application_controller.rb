class ApplicationController < ActionController::Base
	
	before_action :configure_permitted_parameters, if: :devise_controller?

  def not_authorized
  end

  protected

	def configure_permitted_parameters
		added_attrs = [:username,:date_of_birth,:city, :email, :password, :password_confirmation]
   		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      
  		devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    	user_params.permit({ roles: [] },:email, :password, :password_confirmation)
		
  	end
  end
end
