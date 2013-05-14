class MainScreen
  include Gametel

  activity "MasterMindMainActivity"

  text(:number1, :index => 0)
  text(:number2, :index => 1)
  text(:number3, :index => 2)
  text(:number4, :index => 3)

  button(:submit, :text => 'Submit Guess')

  def guess (first, second, third, forth)
    number1 = first.to_s
    number2 = second.to_s
    number3 = third.to_s
    number4 = forth.to_s
  end

  def click_menu_item(which)
    platform.chain_calls do |d|
      # get the id of the menu item, store it in @@id@@
      d.id_from_name which, :target => :Brazenhead, :variable => '@@id@@'
      # give the @@id@@ back to Robotium to click on the menu option
      d.click_on_action_bar_item '@@id@@', :target => :Robotium
    end
  end
end