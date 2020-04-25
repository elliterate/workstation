directory '/usr/local/sbin' do
  owner node['workstation']['user']
  mode '0755'
  action :create
end
