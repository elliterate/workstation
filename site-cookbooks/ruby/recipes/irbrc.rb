template "#{node['workstation']['home']}/.irbrc" do
  owner node['workstation']['user']
  source 'irbrc.erb'
end
