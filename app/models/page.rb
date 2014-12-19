class Page < ActiveRecord::Base
  include Sluggable
  before_save :generate_slug

  belongs_to :category

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
  validates_presence_of :category

  def self.homepage
    self.where("lower(title) = ?", "home").first
  end

  private

end
