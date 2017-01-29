git "#{Chef::Config[:file_cache_path]}/vim-config" do
  repository node['vim']['config']['repository']
  revision node['versions']['vim-config']
  enable_submodules true
  destination "#{Chef::Config[:file_cache_path]}/vim-config"
  action :sync
end

directory node['vim']['config']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "copying vim config to #{node['vim']['config']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/vim-config/ #{node['vim']['config']['dir']}"
  user node['workstation']['user']
end

link "#{node['workstation']['home']}/.vimrc" do
  to "#{node['vim']['config']['dir']}/vimrc"
end
