require 'ruboto/widget'
require 'ruboto/util/toast'

require 'master_mind'
require 'guess_result'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

#java_import "com.joelbyler.mastermind.ruboto.R"
java_import "android.preference.PreferenceManager"


class MasterMindMainActivity
  def on_create(bundle)
    super

    @mastermind = MasterMind.new 4, 2, 1, 9

    set_title $package.R::string::app_name

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => $package.R::string::header_text, :id => 10, :width => :match_parent, :gravity => :center, :text_size => 24.0

          linear_layout :orientation => :horizontal do
            @num1 = edit_text(:single_line => true, :id => 20, :layout => number_field_layout, :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
            @num2 = edit_text(:single_line => true, :id => 21, :layout => number_field_layout, :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
            @num3 = edit_text(:single_line => true, :id => 22, :layout => number_field_layout, :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
            @num4 = edit_text(:single_line => true, :id => 23, :layout => number_field_layout, :input_type => android.text.InputType::TYPE_CLASS_NUMBER)
          end
          button :text => 'Submit Guess', :width => :match_parent, :id => 43, :on_click_listener => proc { process_guess }
        end
    rescue
      puts "Exception creating activity: #{$!}"
      puts $!.backtrace.join("\n")
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

  def start_preferences_activity
    i = android.content.Intent.new
    i.setClassName($package_name, "#{$package_name}.MasterMindPreferencesActivity")
    startActivity(i)
  end

  def start_about_activity
    i = android.content.Intent.new
    i.setClassName($package_name, "#{$package_name}.MasterMindAboutActivity")
    startActivity(i)
  end

  def demo_mode
    prefs = PreferenceManager.getDefaultSharedPreferences self
    prefs.getString("demo_mode", "off") != "off"
  end

  def number_field_layout
    {:width= => :fill_parent, :height= => :wrap_content, :weight= => 1.0}
  end

  def process_guess
    toast 'Nice guess!'

    result = @mastermind.guess(@num1.text.to_s.to_i, @num2.text.to_s.to_i, @num3.text.to_s.to_i, @num4.text.to_s.to_i)

    if result.correctly_guessed
      @text_view.text = $package.R::string::congrats
    else
      @text_view.text = 'You have 2 numbers and 1 positions correct.'
    end
  end

end
