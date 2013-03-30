
require 'rspec-expectations'
require 'brazenhead'
require 'brazenhead/server'
require 'gametel'
require 'require_all'

require_rel 'screens'

World(Gametel::Navigation)

keystore = {
  :path => File.expand_path('~/.android/debug.keystore'),
  :alias => 'androiddebugkey',
  :password => 'android',
  :keystore_password => 'android'
}

server = Brazenhead::Server.new("bin/MasterMindRuboto-debug.apk", keystore)

class Driver
  include Brazenhead
end

Before do
  @driver = Driver.new
  server.start("MasterMindRubotoActivity")
end

After do
  server.stop
end


