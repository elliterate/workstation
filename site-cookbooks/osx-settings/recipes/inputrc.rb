inputrc_location = "#{node['workstation']['home']}/.inputrc"

template inputrc_location do
  owner node['workstation']['user']
  source 'inputrc.erb'
end
