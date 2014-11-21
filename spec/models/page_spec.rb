describe Page, :type => :model do
  context "when new" do
    let(:page) { Page.new }
    it "should have a blank title" do
      expect(page.title).to be_blank
    end
    it "should have a blank content" do
      expect(page.content).to be_blank
    end
    it "should have a blank slug" do
      expect(page.slug).to be_blank
    end
  end
  context "when it is saved" do
    let(:category) do
      category = Category.new
      category.name = "Whatever"
      category.save
      category
    end
    let(:page) do
      page = Page.new
      page.category = category
    end
    it "should be invalid with a blank title" do
      page.title = ""
      page.content = "this is just amazing content"
      expect(page).to be_invalid
    end
    it "should be invalid with blank content" do
      page.title = "this is a good title"
      page.content = ""
      page.save
      expect(page).to be_invalid
    end
    it "should be invalid without a category" do
      page.title = "this is a good title"
      page.content = "wow what content"
      expect(page.valid?).to eq false
    end
  end
end
