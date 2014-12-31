class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :auth_check, :redcarpet

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def auth_check
    head(403) unless logged_in?
  end

  def redcarpet
    @redcarpet ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(filter_html: true, link_attributes: { target: "_blank" } ), autolink: true, tables: true)
  end
end
