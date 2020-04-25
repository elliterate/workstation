oh_my_zsh_version = node['versions']['oh_my_zsh']

git "#{Chef::Config[:file_cache_path]}/oh_my_zsh" do
  repository node['oh_my_zsh']['repository']
  revision oh_my_zsh_version
  destination "#{Chef::Config[:file_cache_path]}/oh_my_zsh"
  action :sync
end

directory node['oh_my_zsh']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying oh-my-zsh's .git to #{node['oh_my_zsh']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/oh_my_zsh/ #{node['oh_my_zsh']['dir']}"
  user node['workstation']['user']
end

template node['oh_my_zsh']['zshrc_path'] do
  source 'oh_my_zsh/zshrc.erb'
  cookbook 'base'
  owner node['workstation']['user']
  mode '0777'
end

node['oh_my_zsh']['custom_scripts'].each do |cookbook_name, custom_scripts|
  custom_scripts.each do |custom_script|
    oh_my_zsh_custom_script custom_script do
      cookbook cookbook_name
    end
  end
end
