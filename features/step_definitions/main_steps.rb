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

Then(/^I press the submit button$/) do
  on(MainScreen).submit
end

Then(/^I enter 4 numbers$/) do
  on(MainScreen).number1 = '1'
  on(MainScreen).number2 = '2'
  on(MainScreen).number3 = '3'
  on(MainScreen).number4 = '4'
end

Given(/^I enter (\d+) correct numbers and (\d+) correct position$/) do |numbers, positions|
  nums = ['0', '0', '0', '0']
  num = numbers.to_i
  pos = positions.to_i
  if pos == 1
    if num >= 1
      nums[0] = '4'
    end
    if num >= 2
      nums[1] = '1'
    end
    if num >= 3
      nums[2] = '9'
    end
    if num == 4
      nums[3] = '2'
    end
  elsif pos == 2
    nums = ['4', '2', '0', '0']
    if num >= 3
      nums[2] = '9'
    end
    if num == 4
      nums[3] = '1'
    end
  elsif pos == 3
    nums = ['4', '2', '1', '0']
  elsif pos == 4
    nums = ['4', '2', '1', '9']
  end
  on(MainScreen).number1 = nums[0]
  on(MainScreen).number2 = nums[1]
  on(MainScreen).number3 = nums[2]
  on(MainScreen).number4 = nums[3]
end

Given(/^I enter all of the correct numbers$/) do
  on(MainScreen).number1 = '4'
  on(MainScreen).number2 = '2'
  on(MainScreen).number3 = '1'
  on(MainScreen).number4 = '9'
end