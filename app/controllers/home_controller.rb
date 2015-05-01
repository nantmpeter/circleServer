class HomeController < ApplicationController
  def index
    circle_id = session[:circle]
    if circle_id
      redirect_to "/circles/"+circle_id.to_s
    end
  end
end
