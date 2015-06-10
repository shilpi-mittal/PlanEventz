class HomeController < ApplicationController
  def index
    @url = request.original_url
    # @url = "www.udacity.com"
  end
end
