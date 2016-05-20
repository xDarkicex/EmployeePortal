class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # app/views/application/index.html.haml
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
  end
  protected
  def configure_permitted_parameters
    [:account_update, :sign_up].each do |action|
      devise_parameter_sanitizer.for(action) << [:avatar, :bio, :skills, :name, :job_title, :portfolio]
    end
  end
end
