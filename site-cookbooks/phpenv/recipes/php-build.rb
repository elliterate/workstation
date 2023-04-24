php_build_version = node['versions']['php-build']

git "#{Chef::Config[:file_cache_path]}/php-build" do
  repository node['php-build']['repository']
  revision php_build_version
  destination "#{Chef::Config[:file_cache_path]}/php-build"
  action :sync
end

directory node['php-build']['dir'] do
  owner node['workstation']['user']
  mode '0777'
  recursive true
end

execute "Copying php-build's .git to #{node['php-build']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/php-build/ #{node['php-build']['dir']}"
  user node['workstation']['user']
end
