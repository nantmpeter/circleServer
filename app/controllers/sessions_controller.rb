class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    name = params[:name]
    pwd = params[:pwd]
    s_user = session[:user]
    if s_user
      redirect_to "/"
    end
    user = User.find_by_name(name)
    if user && user.authenticate(pwd)
      circle = CircleUser.where(:user_id=>user.id).order("id desc").limit(1).take
      session[:circle] = circle.circle_id
      session[:user] = user.id
      @msg = 'success'
    else
      @msg = 'error'
    end
  end

  def destroy
    session[:user] = nil
  end
end
