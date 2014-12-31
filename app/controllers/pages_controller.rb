class PagesController < ApplicationController
  before_action :find_page_or_redirect, except: [:show, :home, :new, :create]
  before_action :find_category, only: [:new, :create, :update, :edit]
  before_action :populate_markdown, only: [:show, :home]

  def show
  end

  def home
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to categories_path, notice: "Page updated"
    else
      redirect_to categories_path, flash: { error: "Page not updated!" }
    end
  end
  def new
    @page = Page.new
  end

  def create
    page = Page.new(page_params)
    page.category = @category
    if page.save
      redirect_to categories_path, notice: "Page created!"
    else
      redirect_to categories_path, flash: { error: page.errors.messages }
    end
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  def find_page_or_redirect
    begin
      @page = Page.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: "Page not found!"
    end
  end

  def populate_markdown
    @page = Page.find_by_slug(params[:slug]) || Page.homepage
    @markdown = redcarpet.render(@page.content).html_safe
  end

  def page_params
    params.require(:page).permit(:title, :content, :category_id, :image)
  end
end
