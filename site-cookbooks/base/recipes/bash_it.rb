bash_it_version = node['versions']['bash_it']

git "#{Chef::Config[:file_cache_path]}/bash_it" do
  repository node['bash_it']['repository']
  revision bash_it_version
  destination "#{Chef::Config[:file_cache_path]}/bash_it"
  action :sync
end

directory node['bash_it']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying bash-it's .git to #{node['bash_it']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/bash_it/ #{node['bash_it']['dir']}"
  user node['workstation']['user']
end

template node['bash_it']['bashrc_path'] do
  source 'bash_it/bashrc.erb'
  cookbook 'base'
  owner node['workstation']['user']
  mode '0777'
end

node['bash_it']['enabled_plugins'].each do |feature_type, features|
  features.each do |feature_name|
    base_bash_it_enable_feature "#{feature_type}/#{feature_name}"
  end
end
