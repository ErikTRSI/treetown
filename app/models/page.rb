class Page < ActiveRecord::Base
  include Sluggable
  before_save :generate_slug, :rank_self, :rank_siblings

  belongs_to :category

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :content
  validates_presence_of :category
  #add validation for self.rank between 1-n

  def self.homepage
    self.where("lower(title) = ?", "home").first
  end

  private

  def rank_self
    unless self.rank
      if Page.any?
        self.rank = Page.order(rank: :desc).first.rank + 1
      else
        self.rank = 1
      end
    end
  end

  def rank_siblings
    siblings = Page.where('rank >= ?', self.rank).order(:rank)
    siblings.each do |s|
      unless s == self
        s.update_attribute(:rank, s.rank + 1)
        s.save
      end
    end
  end

end
