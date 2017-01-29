include_recipe 'postgresql::add_launch_agent'

execute 'create the postgres superuser' do
  command "/usr/local/bin/createuser -U #{node['workstation']['user']} --superuser postgres"
  user node['workstation']['user']
  not_if 'psql -U postgres -c "select 1" &> /dev/null'
end
