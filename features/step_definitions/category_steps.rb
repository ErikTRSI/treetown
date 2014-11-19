Given /^a category$/ do
  @category = Category.new
end

When /^it is new$/ do
end

Then /^name should be blank$/ do
  expect(@category.name).to be_blank
end

