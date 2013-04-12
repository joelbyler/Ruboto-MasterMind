class MainScreen
  include Gametel

  activity "MasterMindRubotoActivity"

  text(:number1, :index => 0)
  text(:number2, :index => 1)
  text(:number3, :index => 2)
  text(:number4, :index => 3)

  button(:submit, :text => 'Submit Guess')
end