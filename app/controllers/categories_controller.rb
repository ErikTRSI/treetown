class CategoriesController < ApplicationController
  before_action :auth_check
  before_action :find_category_or_redirect, except: [:index]
  def index
    @categories = Category.all
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
    @category.destroy
  end

  private

  def find_category_or_redirect
    @category = Category.find(params[:id])
    redirect_to :index unless @category
  end
end
