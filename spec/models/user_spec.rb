describe User, :type => :model do
  context "when it is validated" do
    let(:user) { User.new }
    it "should be invalid without a valid email" do
      user.name = "Parker"
      user.email = "@#34#!34334346.fart"
      user.password = "password"
      user.password_confirmation = user.password
      user.save
      expect(user).to be_invalid
    end
    it "should be invalid without a unique email address" do
      user.name = "Bob"
      user.email = "bob@microsoft.com"
      user.password = "password"
      user.password_confirmation = user.password
      user.save
      invalid_user = User.new
      invalid_user.name = "Robert"
      invalid_user.email = "bob@microsoft.com"
      invalid_user.password = "password"
      invalid_user.password_confirmation = invalid_user.password
      invalid_user.save
      expect(invalid_user).to be_invalid
    end
  end
  context "when it is authenticated" do
    let(:user) do
      user = User.new
      user.name = "My User"
      user.email = "myuser@shammawallatingtang.com"
      user.password = "5ecr3t!"
      user.password_confirmation = user.password
      user.save
      user
    end
    it "should fail with the wrong password" do
      expect(user.authenticate("definitelywrong")).to eq false
    end
    it "should pass with the correct password" do
      expect(user.authenticate("5ecr3t!")).to be_an_instance_of(User)
    end
  end
end
