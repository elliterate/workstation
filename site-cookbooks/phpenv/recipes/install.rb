phpenv_version = node['versions']['phpenv']

git "#{Chef::Config[:file_cache_path]}/phpenv" do
  repository node['phpenv']['repository']
  revision phpenv_version
  destination "#{Chef::Config[:file_cache_path]}/phpenv"
  action :sync
end

directory node['phpenv']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying phpenv's .git to #{node['phpenv']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/phpenv/ #{node['phpenv']['dir']}"
  user node['workstation']['user']
end
