describe MasterMind do
  it "knows what the numbers are" do
    mastermind = MasterMind.new
    mastermind.first.should_not be_nil
    mastermind.second.should_not be_nil
    mastermind.third.should_not be_nil
    mastermind.fourth.should_not be_nil
  end
  it "uses random numbers" do
    mastermind1 = MasterMind.new
    mastermind2 = MasterMind.new
    first_numbers = "#{mastermind1.first},#{mastermind1.second},#{mastermind1.third},#{mastermind1.fourth}"
    second_numbers = "#{mastermind2.first},#{mastermind2.second},#{mastermind2.third},#{mastermind2.fourth}"
    first_numbers.should_not equal second_numbers
  end
  it "can give feedback on a guess" do
    mastermind = MasterMind.new 4, 2, 1, 9
    result = mastermind.guess(1, 2, 3, 4)
    result.should_not be_nil
  end

  it "can determine a user's accuracy" do
    mastermind = MasterMind.new 4, 2, 1, 9
    result = mastermind.guess(4, 1, 3, 4)
    result.correct_numbers.should equal 2
    result.correct_positions.should equal 1
  end
end