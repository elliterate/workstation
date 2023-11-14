cache_path = "#{Chef::Config[:file_cache_path]}/monaspace-fonts"

git cache_path do
  repository node['monaspace']['fonts']['repository']
  revision node['versions']['monaspace-fonts']
  enable_submodules true
  destination cache_path
  action :sync
end

install_script_path = "#{cache_path}/util/install_macos.sh"

file install_script_path do
  mode '755'
end

execute 'install Monaspace fonts' do
  command install_script_path
  cwd File.dirname(install_script_path)
  user node['workstation']['user']
end
