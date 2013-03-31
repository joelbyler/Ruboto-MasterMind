class GuessResult

  attr_accessor :correct_numbers, :correct_positions

  def initialize (numbers, positions)
    @correct_numbers = numbers
    @correct_positions = positions
  end

end