class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_filter :count_hits
  def count_hits
    # This tries to find a existing PageHit by the given url. If it does
    # not find one, it creates one.
    @hit = PageHit.find_or_create_by(url: request.original_url)

    # Issues an UPDATE page_hits WHERE id = 123 SET count = count + 1
    # on the underlying database layer. This atomically increments, so
    # you do not run into race conditions.
    PageHit.increment_counter(:count, @hit.id)
  end
  
  private
  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user = User.find(1)
  end
  helper_method :current_user

end
