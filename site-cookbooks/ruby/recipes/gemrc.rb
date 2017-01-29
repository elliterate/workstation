template "#{node['workstation']['home']}/.gemrc" do
  owner node['workstation']['user']
  source 'gemrc.erb'
end
