class Page < ActiveRecord::Base
  before_save :populate_slug
  belongs_to :category
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
  validates_presence_of :category

  private
   def populate_slug
     self.slug = title.downcase.gsub(/ /, "-")
   end
end
