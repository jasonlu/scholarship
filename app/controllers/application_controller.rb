class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :check_profile
  before_filter :load_config
 

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

  def load_config

    site_configs = SiteConfig::all
    @config = Hash.new
    site_configs.each do |config|

      @config[config.key.to_sym] = config.value

    end
    @config

  end

end

class Float
  def to_s
    to_i == self ? to_i.to_s : self.to_s
  end
end