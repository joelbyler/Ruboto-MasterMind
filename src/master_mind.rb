class MasterMind
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
  def first
    @first
  end
  def second
    @second
  end
  def third
    @third
  end
  def fourth
    @forth
  end

  def guess (first, second, third, fourth)
    correct_numbers = 0
    correct_positions = 0

    if first == @first
      correct_numbers = 1
      correct_positions = 1
    else
      if second == @first
        correct_numbers = 1
      elsif third == @first
        correct_numbers = 1
      elsif fourth == @first
        correct_numbers = 1
      end
    end

    if second == @second
      correct_numbers += 1
      correct_positions += 1
    else
      if first == @second
        correct_numbers += 1
      elsif third == @second
        correct_numbers += 1
      elsif fourth == @second
        correct_numbers += 1
      end
    end
    if third == @third
      correct_numbers += 1
      correct_positions += 1
    else
      if first == @third
        correct_numbers += 1
      elsif second == @third
        correct_numbers += 1
      elsif fourth == @third
        correct_numbers += 1
      end
    end
    if fourth == @fourth
      correct_numbers += 1
      correct_positions += 1
    else
      if first == @fourth
        correct_numbers += 1
      elsif second == @fourth
        correct_numbers += 1
      elsif third == @fourth
        correct_numbers += 1
      end
    end

    GuessResult.new correct_numbers, correct_positions
  end
end
