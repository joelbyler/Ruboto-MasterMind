class AboutScreen
  include Gametel

  activity "MasterMindAboutActivity"

  list_item(:demo_mode, :text => 'Demo Mode')

  def demo_mode= (on_or_off)
    require 'pry'; binding.pry;
    self.demo_mode
    # todo: choose option 1 from single choice list
  end
end