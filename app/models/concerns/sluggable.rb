module Sluggable
  extend ActiveSupport::Concern

  private
  def generate_slug
    self.slug = title.downcase.gsub(/[^\w|\s]/, '').gsub(/ /, '-')
  end

end
