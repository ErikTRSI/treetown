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
  context "when it is validated" do
    let(:category) do
      category = Category.new
      category.name = "Whatever"
      category.save
      category
    end
    let(:page) do
      page = Page.new
      page.category = category
      page
    end
    it "should validate the presence of title" do
      page.title = ""
      page.content = "much content such provocative wow"
      expect(page).to be_invalid
    end
    it "should be invalid with blank content" do
      page.title = "this is a good title"
      page.content = ""
      expect(page).to be_invalid
    end
    it "should be invalid without a category" do
      page.title = "this is a good title"
      page.content = "wow what content"
      page.category = nil
      expect(page).to be_invalid
    end
    it "should validate uniqueness of the title" do
      page.title = "wow what a title"
      page.content = "such content wow"
      page.save
      invalid_page = Page.new(title: page.title, content: "wow whatever", category: category)
      expect(invalid_page).to be_invalid
    end
  end
  context "when it is saved" do
    let(:page) do
      page = Page.new
      page.title = "what a title"
      page.content = "so compelling. bravo."
      page.category = Category.new
      page.save
      return page
    end
    it "should generate a slug" do
      expect(page.slug).to_not be_blank
    end
  end
end
