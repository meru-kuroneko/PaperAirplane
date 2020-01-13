class HomeController < ApplicationController
  skip_before_action :login_check

  def index
    @user_ids = session[:user_ids]
    @tests = %w(a b c)
    render 'home/index'
  end

  def add_account
    @add_account = Account.new(type: params[:type])
    if @add_account.type == "twitter"
      get_twitter_access_token
    elsif get_misskey_access_token
    end
  end

  private

  def get_twitter_access_token
    redirect_to '/auth/twitter'
  end

  def get_misskey_access_token

  end

end
