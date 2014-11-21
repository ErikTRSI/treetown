class AddReferencesToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :pages, index: true
  end
end
