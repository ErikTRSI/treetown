describe User, :type => :model do
  describe "when it is validated" do
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
  describe ".validate_user" do
    let(:user) { User.create(name: "Good user", email: "user@email.com", password: "right_password", password_confirmation: "right_password") }
    it "should return nil with unrecognized email" do
      expect(User.validate_user email: "definitelynot@no.com", password: nil).to be_falsey
    end
    it "should return false with wrong password" do
      expect(User.validate_user email: user.email, password: "notright").to be_falsey
    end
    it "should return the user upon success" do
      expect(User.validate_user email: user.email, password: user.password).to be_an_instance_of User
    end
  end
  describe "#authenticate" do
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
