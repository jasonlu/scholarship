class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_profile
 

  def after_sign_in_path_for(resource)
    
    if current_user.user_profile.nil? || current_user.user_profile.firstname.blank?
      '/profile/edit'
    else
      request.referrer
    end

  end

  def check_profile

    if user_signed_in?
      if current_user.user_profile.nil? || current_user.user_profile.firstname.blank?
        return redirect_to edit_user_profile_path
      end
    end

  end

end