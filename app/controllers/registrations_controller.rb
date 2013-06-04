class RegistrationsController < Devise::RegistrationsController
  protected
  
  def after_sign_up_path_for(resource)
    profile = UserProfile.new
    profile.user_id = current_user.id
    profile.save
    '/profile/edit'
  end

  def after_inactive_sign_up_path_for(resource)
    '/profile/new'
  end




end