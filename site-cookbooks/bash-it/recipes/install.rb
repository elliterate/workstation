bash_it_version = node['versions']['bash-it']

git "#{Chef::Config[:file_cache_path]}/bash-it" do
  repository node['bash-it']['repository']
  revision bash_it_version
  destination "#{Chef::Config[:file_cache_path]}/bash-it"
  action :sync
end

directory node['bash-it']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying bash-it's .git to #{node['bash-it']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/bash-it/ #{node['bash-it']['dir']}"
  user node['workstation']['user']
end

template node['bash-it']['bashrc_path'] do
  source 'bashrc.erb'
  cookbook 'bash-it'
  owner node['workstation']['user']
  mode '0777'
end

node['bash-it']['enabled_plugins'].each do |feature_type, features|
  features.each do |feature_name|
    bash_it_enable_feature "#{feature_type}/#{feature_name}"
  end
end

node['bash-it']['custom_plugins'].each do |cookbook_name, custom_plugins|
  custom_plugins.each do |custom_plugin|
    bash_it_custom_plugin custom_plugin do
      cookbook cookbook_name
    end
  end
end
