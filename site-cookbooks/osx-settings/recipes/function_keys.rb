as_fn_keys = node['function_keys']['use_function_keys_as_function_keys'] ? '0' : '1'

osx_defaults "Turn #{as_fn_keys == '0' ? 'on' : 'off'} function-keys-work-as-function keys" do
  domain "/Users/#{node['workstation']['user']}/Library/Preferences/.GlobalPreferences"
  key 'com.apple.keyboard.fnState'
  boolean node['function_keys']['use_function_keys_as_function_keys']
end
