include_recipe 'oh-my-zsh'

powerlevel10k_version = node['versions']['powerlevel10k']

git "#{Chef::Config[:file_cache_path]}/powerlevel10k" do
  repository node['powerlevel10k']['repository']
  revision powerlevel10k_version
  destination "#{Chef::Config[:file_cache_path]}/powerlevel10k"
  action :sync
end

directory node['powerlevel10k']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying powerlevel10k's .git to #{node['powerlevel10k']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/powerlevel10k/ #{node['powerlevel10k']['dir']}"
  user node['workstation']['user']
end
