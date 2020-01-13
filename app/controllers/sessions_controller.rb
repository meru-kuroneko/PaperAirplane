class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    if session[:user_ids].nil?
      session[:user_ids] = []
    end
    if session[:user_info].nil?
      session[:user_info] = []
    end
    session[:user_ids].push(user_data[:uid])
    session[:user_info].push(user_data[:info])
    cookies[:credentials] = {value: {id: user_data[:uid], value: user_data[:credentials]}, secure: true, httpOnly: true}
    redirect_to root_path, notice: 'ログインしました'
  end
end