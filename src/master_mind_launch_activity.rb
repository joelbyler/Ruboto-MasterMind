require 'ruboto/widget'

# Wrapper class, needed in order to have menu on main screen
class MasterMindLaunchActivity

  def on_create(bundle)
    super
    i = android.content.Intent.new
    i.setClassName($package_name, "#{$package_name}.MasterMindMainActivity")
    startActivity(i)
    finish
  end
end
