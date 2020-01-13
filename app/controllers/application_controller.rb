class ApplicationController < ActionController::Base
  before_action :login_check

  def login_check
    @user_ids = session[:user_ids]
    if @user_ids.nil?
      session[:user_ids] = []
      redirect_to add_accounts_path
    end
  end

end
