class HomeController < ApplicationController
  def index
    @url = request.original_url
    @user = User.find(1)
  end
end
