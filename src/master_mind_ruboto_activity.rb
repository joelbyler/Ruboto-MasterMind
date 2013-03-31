require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText

# http://xkcd.com/378/
java_import "com.joelbyler.mastermind.ruboto.R"


class MasterMindRubotoActivity
  def on_create(bundle)
    super
    set_title R::string::app_name

    self.content_view =
        linear_layout :orientation => :vertical do
          @text_view = text_view :text => R::string::header_text, :id => 10, :width => :match_parent, :gravity => :center, :text_size => 24.0

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

  private

  def process_guess
    toast 'Nice guess!'
    @text_view.text = 'You have 2 numbers and 1 positions correct.'
  end

  def number_field_layout
    {:width= => :fill_parent, :height= => :wrap_content, :weight= => 1.0}
  end

end
