class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    add_user_ids(user_data[:uid])
    add_user_info(user_data[:extra][:raw_info])
    add_credentials(user_data[:uid], user_data[:credentials])
    redirect_to root_path, notice: 'ログインしました'
  end

  private

  def add_user_ids(uid)
    ids = session[:user_ids]
    if ids.nil?
      ids = []
    end
    if ids.exclude?(uid)
      ids.push(uid)
    end
    session[:user_info] = ids
  end

  def add_user_info(user_info)
    info = session[:user_info]
    if info.nil?
      info = []
    end
    if info.exclude?(user_info)
      info.push(user_info)
    end
    session[:user_info] = info
  end

  def add_credentials(uid, credentials)
    cookie = cookies[:credentials]
    val = {"token" => credentials[:token], "secret" => credentials[:secret]}
    json_item = JSON.generate({uid => {"token" => credentials[:token], "secret" => credentials[:secret]}})

    if cookie.nil?
      cookie = {value: json_item, secure: true, httpOnly: true}
    elsif cookie[uid].nil?
      cookie[uid] = val
    else
      cookie.store(uid, val)
    end
    cookies[:credentials] = cookie
  end
end