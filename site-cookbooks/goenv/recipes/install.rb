goenv_version = node['versions']['goenv']

git "#{Chef::Config[:file_cache_path]}/goenv" do
  repository node['goenv']['repository']
  revision goenv_version
  destination "#{Chef::Config[:file_cache_path]}/goenv"
  action :sync
end

directory node['goenv']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying goenv's .git to #{node['goenv']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/goenv/ #{node['goenv']['dir']}"
  user node['workstation']['user']
end
