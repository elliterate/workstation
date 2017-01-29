git "#{Chef::Config[:file_cache_path]}/powerline-fonts" do
  repository node['powerline']['fonts']['repository']
  revision node['versions']['powerline-fonts']
  enable_submodules true
  destination "#{Chef::Config[:file_cache_path]}/powerline-fonts"
  action :sync
end

execute 'install Powerline fonts' do
  command "#{Chef::Config[:file_cache_path]}/powerline-fonts/install.sh"
  user node['workstation']['user']
end
