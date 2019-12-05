class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic

  private

  def basic
    if Rails.env == "production"
      authenticate_or_request_with_http_basic do |name, password|
        name == Rails.application.credentials.basic[:basic_auth_name] && password == Rails.application.credentials.basic[:basic_auth_password]
      end
    end
  end
end
