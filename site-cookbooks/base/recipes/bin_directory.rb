include_recipe 'base::bash_it'

directory "#{node['workstation']['home']}/#{node['workstation']['bin_directory']}" do
  owner node['workstation']['user']
  mode '0755'
  action :create
end

base_bash_it_custom_plugin 'bash_it/custom/bin.bash' do
  variables 'bin_directory' => node['workstation']['bin_directory']
end
