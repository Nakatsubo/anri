class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    user_path(@user.name)
  end
end
