template "#{node['workstation']['home']}/.psqlrc" do
  owner node['workstation']['user']
  source 'psqlrc.erb'
end

directory "#{node['workstation']['home']}/.psql" do
  owner node['workstation']['user']
  mode '0755'
  action :create
end
