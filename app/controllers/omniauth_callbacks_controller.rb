class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    sign_up_or_signin request.env["omniauth.auth"].info.name
  end

  alias_method :yandex, :facebook
  alias_method :google, :facebook



  def sign_up_or_signin(name, uid=request.env["omniauth.auth"].uid, provider=request.env["omniauth.auth"].provider)
    @user = User.find_for_oauth(name, uid, provider)

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => provider.humanize ) if is_navigational_format?
  end

end