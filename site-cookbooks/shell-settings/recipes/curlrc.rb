template "#{node['workstation']['home']}/.curlrc" do
  owner node['workstation']['user']
  source 'curlrc.erb'
end
