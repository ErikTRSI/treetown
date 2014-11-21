describe Category, type: :model do
  context "when it is new" do
    let(:category) { Category.new }
    it "should have a blank name" do
      expect(category.name).to be_blank
    end
    it "should have a blank slug" do
      expect(category.slug).to be_blank
    end
    it "should have a `pages` array" do
      expect(category.pages).to be_empty
    end
  end
  context "when it is saved" do
    let(:category) { Category.new }
    before { category.save }
    it "should be invalid when name is blank" do
      expect(category).to be_invalid
    end
  end
end
