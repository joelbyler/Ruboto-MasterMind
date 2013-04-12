class MasterMind
  attr_accessor :first, :second, :third, :forth
  def initialize (first=nil, second=nil, third=nil, forth=nil)
    if (first == nil)
      @first = rand(0..9)
    else
      @first = first
    end
    if (second == nil)
      @second = rand(0..9)
    else
      @second = second
    end
    if (third == nil)
      @third = rand(0..9)
    else
      @third = third
    end
    if (forth == nil)
      @forth = rand(0..9)
    else
      @forth = forth
    end
  end

  def numbers
    [@first, @second, @third, @forth]
  end

  def find_correct_positions(first, second, third, forth)
    correct_positions = 0
    correct_positions += 1 if first == @first
    correct_positions += 1 if second == @second
    correct_positions += 1 if third == @third
    correct_positions += 1 if forth == @forth
    return correct_positions
  end

  def find_correct_numbers (first, second, third, forth)
    correct_numbers = 0
    guessed_numbers = [first, second, third, forth]
    numbers.each do |number|
      if (guessed_numbers.include? number)
        correct_numbers += 1
      end
    end
    return correct_numbers
  end

  def guess (first, second, third, forth)
    correct_numbers = find_correct_numbers(first, second, third, forth)
    correct_positions = find_correct_positions(first, second, third, forth)
    GuessResult.new correct_numbers, correct_positions
  end
end
