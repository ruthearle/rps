require 'capybara'

Given(/^I am on the homepage$/) do
  ('/')
end

When(/^I follow "(.*?)"$/) do |link|
	click_on(link)
end