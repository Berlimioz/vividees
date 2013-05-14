When /^I visit the (?:root|home) page$/ do
  visit('/')
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "([^"]*)"$/ do |text|
  page.should_not have_content(text)
end

Then /^Capybara should use the "([^"]*)" driver$/ do |driver|
  Capybara.current_driver.should == driver.to_sym
end

When /^I use a matcher that fails$/ do
  begin
    page.should have_css('h1#doesnotexist')
  rescue StandardError => e
    @error_message = e.message
  end
end

Then /^the failing exception should be nice$/ do
  @error_message.should =~ %r(expected to find css \"h1#doesnotexist\")
end

When /^I click "(.*?)"$/ do |link|
  click_link(link)
end

When /^I click the tutorial link$/ do
  click_link(I18n.t("welcome.tutorial"))
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |el, value|
  fill_in(el, :with => value)
end

When /^I fill in by id "(.*?)" with "(.*?)"$/ do |el, value|
  find('.'+el).set value
end

When /^I press "(.*?)"$/ do |button|
  button = I18n.t(button, default: button)
  click_button(button)
end

When /^I enter my password$/ do
  find('.js-password').set 'password'
  find('.js-password-confirmation').set 'password'
end

When /^(?:|I )select "(.+)" from "(.+)"$/ do |value, field|
  value = I18n.t(value, :default => value)
  field = I18n.t(field, :default => field)
  select(value, :from => field)
end

Then /^show me the page$/ do
  save_and_open_page
end

#Then /^"([^"]*)" should be selected for "([^"]*)"(?: within "([^\"]*)")?$/ do |value, field, selector|
#  with_scope(selector) do
#    field_labeled(field).find(:xpath, ".//option[@selected = 'selected'][text() = '#{value}']").should be_present
#  end
#end