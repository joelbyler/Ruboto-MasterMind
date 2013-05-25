require 'ruboto/widget'
require 'ruboto/util/toast'

require 'master_mind'
require 'guess_result'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

java_import "android.preference.PreferenceManager"
java_import "android.content.Context"


class MasterMindMainActivity
  def on_create(bundle)
    super

    initialize_game

    set_title $package.R::string::app_name

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => $package.R::string::header_text, :id => 10, :width => :match_parent, :gravity => :center, :text_size => 24.0

          linear_layout :orientation => :horizontal do
            @num1 = number_field
            @num2 = number_field
            @num3 = number_field
            @num4 = number_field
          end
          button :text => 'Submit Guess', :width => :match_parent, :on_click_listener => proc { process_guess }
        end
    rescue
      puts "Exception creating activity: #{$!}"
      puts $!.backtrace.join("\n")
  end

  def number_field
    edit_text(:single_line => true, :layout => number_field_layout, :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
  end

  def number_field_layout
    {:width= => :fill_parent, :height= => :wrap_content, :weight= => 1.0}
  end

  def on_create_options_menu(menu)
    getMenuInflater().inflate($package.R.menu.mainmenu, menu)
    true
  end

  def onOptionsItemSelected(item)
    if item.get_item_id == $package.R.id.menu_about
      start_about_activity
    else
      start_preferences_activity
    end
    true
  end

  def initialize_game
    if demo_mode
      toast 'turning demo mode ON'
      @mastermind = MasterMind.new 4, 2, 1, 9
    else
      toast 'turning demo mode OFF'
      @mastermind = MasterMind.new
    end
  end
  def on_pause
    super
    @demo_mode = demo_mode
  end

  def on_resume
    super
    if @demo_mode != demo_mode
      initialize_game
    end
  end

  def start_preferences_activity
    start_an_activity "MasterMindPreferencesActivity"
  end

  def start_about_activity
    start_an_activity "MasterMindAboutActivity"
  end

  def start_an_activity (activity)
    i = android.content.Intent.new
    i.setClassName($package_name, "#{$package_name}.#{activity}")
    start_activity(i)
  end

  def demo_mode
    PreferenceManager.getDefaultSharedPreferences(self).get_boolean("DEMO_MODE", false)
  end

  def process_guess
    toast 'Nice guess!'
    result = @mastermind.guess(to_guess(@num1), to_guess(@num2), to_guess(@num3), to_guess(@num4))
    @text_view.text = result_message result
  end

  def to_guess (field)
    field.text.to_s.to_i
  end

  def result_message (result)
    return $package.R::string::congrats if result.correctly_guessed
    return "You have " + result.correct_numbers.to_s + " numbers and " + result.correct_positions.to_s + " positions correct."
  end

end
