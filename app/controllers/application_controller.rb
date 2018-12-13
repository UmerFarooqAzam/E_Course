class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	 protected 
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) {|s| s.permit(:name,:email,:password,:password_confirmation,:remember_me)}
		devise_parameter_sanitizer.permit(:sign_in) {|s| s.permit(:email,:password,:remember_me)}
		devise_parameter_sanitizer.permit(:account_update) {|s| s.permit(:name,:email,:password,:password_confirmation,:remember_me)}
	

	end
    
end
