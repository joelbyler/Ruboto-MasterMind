class PreferencesScreen
  include Gametel

  activity "MasterMindPreferencesActivity"

  list_item(:demo_mode, :text => 'Demo Mode')

  list_item(:demo_mode_off, :text => 'Off (default)')
  list_item(:demo_mode_on, :text => 'On') # (numbers will be 4-2-1-9)')
end