
prefs = node['workstation']['text']

osx_defaults "#{prefs['automatically_correct_spelling'] ? 'enable' : 'disable'} automatic spelling correction" do
  domain "/Users/#{node['workstation']['user']}/Library/Preferences/.GlobalPreferences"
  key 'NSAutomaticSpellingCorrectionEnabled'
  boolean prefs['automatically_correct_spelling']
  only_if { prefs.keys.include?('automatically_correct_spelling') }
end
