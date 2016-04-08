class HomeController < ApplicationController

  def index
  	@stores = Store.all
  	@lat_lng = cookies[:lat_lng].split("|")
  end


end
