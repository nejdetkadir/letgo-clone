class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  prepend_before_action :configure_recaptcha, if: :devise_controller?

  def configure_recaptcha
    Recaptcha.configure do |config|
      config.site_key = Setting.recaptcha_site_key
      config.secret_key = Setting.recaptcha_secret_key
    end
  end

  protected

  def update_view_count(model)
    if cookies[model.id].nil?
      cookies[model.id] = {value: true, expires: 1.day.from_now}
      model.update(view_count: model.view_count + 1)
    end
  end

  def check_admin
    # Use with: before_action :check_admin
    redirect_back(fallback_location: root_path, alert: 'You are not authorized to access') unless current_user.admin?
  end

  private
  
  def user_not_authorized
    flash[:alert] = 'You are not authorized to view this page'
    redirect_to(request.referer || root_path)
  end
end
