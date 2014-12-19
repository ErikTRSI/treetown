describe Category, type: :model do
  describe "when it is new" do
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
  describe "when validating" do
    it "should be invalid with a blank name" do
      expect(subject).to be_invalid
    end
  end

  describe "#generate_slug" do
    # let(:category) do
    # end
    it "should replace spaces with dashes" do
      category = Category.create(name: "valid name")
      expect(category.slug).to eq "valid-name"
    end
    it "should convert to lowercase" do
      category = Category.create(name: "VALIDNAME")
      expect(category.slug).to eq "validname"
    end
    it "should strip non-alphanumeric characters" do
      category = Category.create(name: "valid!@$##$%^&*%^*(name")
      expect(category.slug).to eq "validname"
    end
  end
end
