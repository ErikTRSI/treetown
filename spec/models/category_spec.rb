#require 'spec_helper'

describe Category, type: :model do
  it "should have a blank name when new" do
    category = Category.new
    expect(category.name).to be_blank
  end
end
