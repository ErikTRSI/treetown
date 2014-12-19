class Category < ActiveRecord::Base
  include Sluggable
  before_save :generate_slug
  has_many :pages

  validates_presence_of :name
  validates_uniqueness_of :name

  alias_attribute :title, :name
end
