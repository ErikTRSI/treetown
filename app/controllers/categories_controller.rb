class CategoriesController < ApplicationController
  before_action :verify_user
  def index
    @categories = Category.all
  end
  private
  def verify_user
    current_user
  end
end
