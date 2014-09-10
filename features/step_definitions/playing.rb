require 'capybara'

When(/^I click "(.*?)"$/) do |arg1|
  click_link arg1

end

When(/^I enter my name$/) do
  fill_in "name", with: "Stephen"
end

Then(/^I should be ready to play$/) do
  expect(page).to have_content("Welcome")
end

Then(/^I should be asked if I want to "(.*?)" or "(.*?)"$/) do |arg1, arg2|
	visit '/new-game'
	click_button arg1
	click_button arg2
end

Given(/^I click on "(.*?)"$/) do |arg1|
	visit '/play'
end


When(/^I see RESULTS$/) do
	visit '/outcome'

end

Then(/^I should be able to click "(.*?)" or click "(.*?)"$/) do |arg1, arg2|
	visit '/outcome'
end