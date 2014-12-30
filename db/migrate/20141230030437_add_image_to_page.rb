class AddImageToPage < ActiveRecord::Migration
  def up
    add_attachment :pages, :image
  end

  def down
    remove_attachment :pages, :image
  end
end
