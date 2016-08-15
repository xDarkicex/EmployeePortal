class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # app/views/application/index.html.haml
  before_action :configure_permitted_parameters, if: :devise_controller?

  def welcome
    @employees = User.all
    @pdfs = Pdf.all
    @products = Product.all
    @announcement = Message.where(private:false).last
    if user_signed_in?
      @private_messages = current_user.messages
    end
  end

  def authenticate_admin
    redirect_to "http://www.lmgtfy.com?q=go+away+this+is+private" unless current_user.admin
  end
  protected
  def configure_permitted_parameters
    [:account_update, :sign_up].each do |action|
      devise_parameter_sanitizer.for(action) << [:avatar, :bio, :gender, :sexuality, :skills, :name, :jobtitle, :phone, :portfolio, :email, :user, :employeepassword, :region, :salesrep ]
    end
  end
end
