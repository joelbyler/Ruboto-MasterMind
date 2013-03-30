When(/^the application launches$/) do
  puts "Sleep..."
  sleep (1) until ready_to_go
end

def ready_to_go
  puts "Zzzz..."
  on(MainScreen).has_text?('Starting...') == false
end

Then(/^I see "(.*?)"$/) do |text|
  on(MainScreen).has_text?(text).should == true
end

Then(/^I see a submit button$/) do
  on(MainScreen).submit
end

Then(/^I can enter 4 numbers$/) do
  on(MainScreen).number1 = '1'
  on(MainScreen).number2 = '2'
  on(MainScreen).number3 = '3'
  on(MainScreen).number4 = '4'
end
