class ApplicationController < ActionController::Base
  before_action :authorize,:except => :create
  def authorize
  	p 2222222222222
  	p session[:user]
    unless session[:user]
      redirect_to "/login"
    else
    	@circle = Circle.find(session[:circle])    	
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
