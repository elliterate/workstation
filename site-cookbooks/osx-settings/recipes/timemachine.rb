osx_defaults 'stop TimeMachine from asking to use every new disk' do
  domain 'com.apple.TimeMachine'
  key 'DoNotOfferNewDisksForBackup'
  boolean true
end

read_cmd = "sudo -u #{node['workstation']['user']} defaults read com.apple.systemuiserver menuExtras"
old_menu_extras_cmd = Mixlib::ShellOut.new(read_cmd)
old_menu_extras_cmd.run_command
old_menu_extras = old_menu_extras_cmd.stdout

new_menu_extras = old_menu_extras.split("\n").select { |line| line !~ /TimeMachine.menu/ }.join("\n")

execute 'remove TimeMachine from the menubar' do
  command "defaults write com.apple.systemuiserver menuExtras \'#{new_menu_extras}\'"
  user node['workstation']['user']
  only_if { new_menu_extras != old_menu_extras }
  notifies :run, 'execute[restart SystemUIServer]'
end

execute 'restart SystemUIServer' do
  command 'killall -HUP SystemUIServer'
  action :nothing
  ignore_failure true # SystemUIServer is not running if not logged in
end

execute "verify TimeMachine is not in the menubar" do
  command '! defaults read com.apple.systemuiserver menuExtras | grep TimeMachine.menu'
  user node['workstation']['user']
end
