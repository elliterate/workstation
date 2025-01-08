APPEARANCES = {
  'graphite' => 6
}

HIGHLIGHT_COLORS = {
  'blue' => '0.699008 0.844165 1.000000'
}

prefs = node['workstation']['general_preferences']

osx_defaults "set appearance to #{prefs['appearance']}" do
  key 'AppleAquaColorVariant'
  domain :global
  integer APPEARANCES[prefs['appearance']]
  only_if { prefs['appearance'] }
end

osx_defaults "set highlight color to #{prefs['highlight_color']}" do
  key 'AppleHighlightColor'
  domain :global
  string HIGHLIGHT_COLORS[prefs['highlight_color']]
  only_if { prefs['highlight_color'] }
end

execute 'restart SystemUIServer' do
  command 'killall -KILL SystemUIServer'
  ignore_failure true
  only_if { prefs.any? }
end
