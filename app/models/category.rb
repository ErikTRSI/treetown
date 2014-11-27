class Category < ActiveRecord::Base
  before_save :populate_slug
  has_many :pages

  validates_presence_of :name
  validates_uniqueness_of :name

  private
   def populate_slug
     self.slug = name.downcase.gsub(/ /, "-")
   end
end
