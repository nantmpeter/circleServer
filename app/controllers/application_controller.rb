class ApplicationController < ActionController::Base
  before_action :authorize,:except => :create
  def authorize
    unless session[:user]
      redirect_to "/login"
    end
    @circle = Circle.find(session[:circle])
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
