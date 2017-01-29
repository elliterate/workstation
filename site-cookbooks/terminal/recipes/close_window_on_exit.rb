include_recipe 'terminal::check_for_active'
term_opts = node['workstation']['terminal']

key = ":Window\\ Settings:#{term_opts['default_profile']}:shellExitAction"
file = "#{node['workstation']['home']}/Library/Preferences/com.apple.Terminal.plist"
plist_cmd = '/usr/libexec/PlistBuddy -c'

execute "#{plist_cmd} 'add #{key} integer 1' #{file}" do
  ignore_failure true
  user node['workstation']['user']
end

execute "#{plist_cmd} 'set #{key} 1' #{file}" do
  ignore_failure true
  user node['workstation']['user']
end
