template "#{node['workstation']['home']}/.pystartup" do
  owner node['workstation']['user']
  source 'pystartup.erb'
end
