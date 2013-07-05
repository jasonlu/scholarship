class ApplicationController < ActionController::Base
  #protect_from_forgery
  layout "application"
  #before_filter :check_profile
  before_filter :load_config
  #before_filter :set_cookie
  #before_filter :set_layout
 

  def set_layout
    @domain = request.subdomains.first
    if @domain == "admin" && !user_signed_in?
      self.class.layout "admin"
    end
  end

  def after_sign_in_path_for(resource)
    session_id = request.session_options[:id]
    user_id = current_user.id
    carts = Cart.where("session_id = ?", session_id).update_all(:user_id => user_id)

    if current_user.user_profile.nil? || current_user.user_profile.firstname.blank?
      '/profile/edit'
    else
      #request.referrer
      '/'
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

  def set_cookie
    if cookies[:cart_id].blank?
      session_id = request.session_options[:id]
      cookies[:cart_id] = { :value => session_id, :expires => Time.now + (86400 * 3)}
    end
  end

end

class Float
  def to_s
    to_i == self ? to_i.to_s : self.to_s
  end
end