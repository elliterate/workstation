directory "#{node['workstation']['home']}/#{node['workstation']['bin_directory']}" do
  owner node['workstation']['user']
  mode '0755'
  action :create
end
