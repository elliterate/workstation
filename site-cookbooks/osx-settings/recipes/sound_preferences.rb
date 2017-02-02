read_cmd = "sudo -u #{node['workstation']['user']} defaults read com.apple.systemuiserver menuExtras"
old_menu_extras_cmd = Mixlib::ShellOut.new(read_cmd)
old_menu_extras_cmd.run_command
old_menu_extras = old_menu_extras_cmd.stdout

new_menu_extras = old_menu_extras.split("\n").select { |line| line !~ /Volume.menu/ }.join("\n")

execute 'remove Volume from the menubar' do
  command "defaults write com.apple.systemuiserver menuExtras \'#{new_menu_extras}\'"
  user node['workstation']['user']
  only_if { new_menu_extras != old_menu_extras }
  notifies :run, 'execute[restart SystemUIServer]'
end

execute 'add Volume to the menubar' do
  command "defaults write com.apple.systemuiserver menuExtras -array-add '/System/Library/CoreServices/Menu Extras/Volume.menu'"
  user node['workstation']['user']
  only_if { node['workstation']['sound_preferences']['show_volume_in_menubar'] }
  notifies :run, 'execute[restart SystemUIServer]'
end

execute 'restart SystemUIServer' do
  command 'killall -HUP SystemUIServer'
  action :nothing
  ignore_failure true # SystemUIServer is not running if not logged in
end
