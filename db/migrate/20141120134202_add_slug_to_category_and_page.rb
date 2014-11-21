class AddSlugToCategoryAndPage < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    add_column :pages, :slug, :string
  end
end
