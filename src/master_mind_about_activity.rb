require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :Button, :LinearLayout, :TextView

# http://xkcd.com/378/

class MasterMindAboutActivity
  def onCreate(bundle)
    super
    set_title 'About the Application'

    self.content_view =
        linear_layout :orientation => :vertical do
          text_view :text => 'Ruboto MasterMind', :id => 42, :width => :match_parent, :gravity => :center, :text_size => 48.0
          text_view :text => 'Version 0.1', :id => 42, :width => :match_parent, :gravity => :center, :text_size => 48.0
        end
  rescue
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def butterfly
    @text_view.text = 'What hath Matz wrought!'
    toast 'Flipped a bit via butterfly'
  end

end
