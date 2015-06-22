module Authentication
protected
#------------------------ To store Location ------------------------#
  def store_origin
    return unless request.get?
    if (!request.xhr?)
      session[:origin] = request.url
    end
  end

  def goto_origin(default=root_url)
    redirect_to(session[:origin] || default)
    session[:origin] = nil
  end

  def origin_path(default=root_url)
    session[:origin] || default
  end
#------------------------ To store Location ------------------------#
end	