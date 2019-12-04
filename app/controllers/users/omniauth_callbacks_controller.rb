class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    callback_from :twitter
  end

  private

  def callback_from(provider)
    provider = provider.to_s

    @user = User.find_for_oauth(request.env['omniauth.auth'])

    auth = request.env['omniauth.auth']
    $access_token = auth.extra.access_token.token
    $access_token_secret = auth.extra.access_token.secret

    if @user.persisted?
      print("persisted true")
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      print("persisted false")
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to controller: 'sessions', action: 'new'
    end
  end
end