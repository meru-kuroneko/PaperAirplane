class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    add_user_info(user_data[:uid], user_data[:info])
    add_credentials(user_data[:uid], user_data[:credentials])
    redirect_to root_path, notice: 'ログインしました'
  end

  private

  def add_user_info(uid, user_info)
    if session[:user_info].nil?
      session[:user_info] = []
      session[:user_info].push({uid: uid, info: user_info})
      return
    end

    if session[:user_info].none? { |item| item["uid"] == uid }
      session[:user_info].push({uid: uid, info: user_info})
    else
      session[:user_info].each { |item|
        if item["uid"] == uid
          item[:info] = user_info
        end }
    end
  end

  def add_credentials(uid, credentials)
    json_item = {"token" => credentials[:token], "secret" => credentials[:secret]}.to_json
    cookies[uid] = {value: json_item, secure: true, httpOnly: true}
  end
end