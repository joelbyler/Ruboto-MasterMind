When /^I click the first list item by "(.+)"$/ do |type|
  on(MainMenuScreen).send "first_list_item_#{type}"
end

Given(/^I switch to demo mode$/) do
  on(MainScreen).click_menu_item 'menu_prefs'
  on(PreferencesScreen).demo_mode
  # todo: choose option 1 from single choice list
end

