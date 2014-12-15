class PagesController < ApplicationController
  def show
    @page = Page.find_by_slug(params[:slug]) || Page.homepage
  end

  def home
    @page = Page.homepage
  end
end
