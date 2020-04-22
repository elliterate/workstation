template "#{node['workstation']['home']}/.psqlrc" do
  owner node['workstation']['user']
  source 'psqlrc.erb'
end
