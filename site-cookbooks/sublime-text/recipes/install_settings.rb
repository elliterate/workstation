include_recipe 'sublime-text::install'

[
  'Packages/User/Preferences',
  'Packages/User/Python',
].each do |name|
  settings_path = "#{name}.sublime-settings"

  template "#{node['sublime-text']['settings']['dir']}/#{settings_path}" do
    source settings_path
    owner node['workstation']['user']
  end
end
