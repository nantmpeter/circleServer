class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    @name = params[:name]
    @pwd = params[:pwd]
    @s_user = session[:user]
    if @s_user
      redirect_to :action => 'new'
    end
    @user = User.find_by_name(@name)
    if @user && @user.authenticate(@pwd)
      session[:user] = @user
      @msg = 'success'
    else
      @msg = 'error'
    end
  end

  def destroy
    session[:user] = nil
  end
end
