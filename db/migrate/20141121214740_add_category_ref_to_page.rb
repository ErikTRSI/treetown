class AddCategoryRefToPage < ActiveRecord::Migration
  def change
    add_reference :pages, :category
  end
end
