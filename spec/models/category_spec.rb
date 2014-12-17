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
  context "when validating" do
    it "should be invalid with a blank name" do
      expect(subject).to be_invalid
    end
  end

  describe "#populate_slug" do
    let(:category) do
      category = Category.new(name: "Valid name")
      category.save
      return category
    end
    it "should get a slug value" do
      expect(category.slug).to_not be_blank
    end
  end
end
