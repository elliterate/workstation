prefs = node['workstation']['dashboard_preferences']

osx_defaults "set dashboard state to #{prefs['state']}" do
  domain 'com.apple.dashboard'
  key 'dashboard-enabled-state'
  case prefs['state']
  when 'off'
    integer 1
  when 'space'
    integer 2
  when 'layer'
    integer 3
  else
    raise "invalid dashboard state: #{prefs['state'].inspect}"
  end
  only_if { prefs['state'] }
end
