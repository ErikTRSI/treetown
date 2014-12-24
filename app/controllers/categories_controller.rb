class CategoriesController < ApplicationController
  before_action :auth_check
  before_action :find_category_or_redirect, except: [:index, :new, :create]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    #flash[:notice] = "Category created!"
    redirect_to categories_path, notice: "Category created!"
  end

  def edit
  end

  def update
    flash_param = @category.update(category_params) ? { flash: { notice: "Category updated" } } : { flash: { error: "Category changes not saved!" } }
    redirect_to action: :index
  end

  def delete
  end

  def destroy
    @category.destroy
    redirect_to action: :index, error: "Category deleted!"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
  def find_category_or_redirect
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @category = nil
    end
    redirect_to action: :index, flash: { error: "Category not found!" } unless @category
  end
end
