prefs = node['workstation']['finder_preferences']

new_window_targets = {
  :computer => 'PfCm',
  :desktop => 'PfDe',
  :documents => 'PfDo',
  :home => 'PfHm',
  :recents => 'PfAF',
  :volume => 'PfVo',
  :icloud => 'PfID',
}

osx_defaults "set finder new window to \"#{prefs['new_window']}\"" do
  domain 'com.apple.finder'
  key 'NewWindowTarget'
  string new_window_targets[prefs['new_window'].downcase]
  not_if { prefs['new_window'].nil? }
end
