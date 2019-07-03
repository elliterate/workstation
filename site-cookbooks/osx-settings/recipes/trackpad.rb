TAP_BEHAVIOR = {
  "click" => 1
}

prefs = node['workstation']['trackpad']

osx_defaults "set tap behavior to #{prefs['tap_behavior']}" do
  domain "/Users/#{node['workstation']['user']}/Library/Preferences/.GlobalPreferences"
  key "com.apple.mouse.tapBehavior"
  integer TAP_BEHAVIOR[prefs['tap_behavior']]
  only_if { prefs.keys.include?('tap_behavior') }
end

osx_defaults "#{prefs['tap_behavior'] == 'click' ? 'enable' : 'disable'} built-in trackpad click" do
  domain 'com.apple.AppleMultitouchTrackpad'
  key 'Clicking'
  boolean prefs['tap_behavior'] == 'click'
  only_if { prefs.keys.include?('tap_behavior') }
end

osx_defaults "#{prefs['tap_behavior'] == 'click' ? 'enable' : 'disable'} external trackpad click" do
  domain 'com.apple.driver.AppleBluetoothMultitouch.trackpad'
  key 'Clicking'
  boolean prefs['tap_behavior'] == 'click'
  only_if { prefs.keys.include?('tap_behavior') }
end
