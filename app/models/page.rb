class Page < ActiveRecord::Base
  before_save :populate_slug
  belongs_to :category
  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
  validates_presence_of :category

  def self.homepage
    self.where("lower(title) = ?", "home").first
  end
  private
   def populate_slug
     self.slug = title.downcase.split("").map { |c| c if c =~ /[A-Za-z0-9\- ]/ }.join.gsub(/ /, "-")
   end
end
