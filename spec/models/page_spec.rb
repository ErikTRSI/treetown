describe Page, :type => :model do
  describe ".homepage" do
    context 'with a homepage' do
      let!(:homepage) { @homepage = Page.create(title: "Home", content: "wonderful homepage", category: Category.new) }

      it "returns the Home page with the correct slug" do
        expect(Page.homepage).to eq homepage
      end
    end

    context 'without a homepage' do
      it 'returns nil' do
        expect(Page.homepage).to eq nil
      end
    end
  end

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

  context 'validations' do
    it 'should be invalid without all valid fields' do
      page = Page.create(title: nil, content: nil, category: nil)
      expect(page.errors.messages.keys).to eq [:title, :content, :category]
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
    it "should allow more than 255 characters in the Content field" do
      page.content = ("0123456789" * 100)
      expect { page.save }.to_not raise_error
    end
  end

  describe "#populate_slug" do
    it 'changes spaces to dashes' do
      page = Page.create(title: 'what a title', content: 'content', category: Category.new)
      expect(page.slug).to eq 'what-a-title'
    end

    it 'removes punctuation' do
      page = Page.create(title: 'what!@%@#$ a@#$^$$&?? title', content: 'content', category: Category.new)
      expect(page.slug).to eq 'what-a-title'
    end

    it 'changes all characters to lowercase' do
      page = Page.create(title: 'WHAT A TITLE', content: 'content', category: Category.new)
      expect(page.slug).to eq 'what-a-title'
    end
  end
end
