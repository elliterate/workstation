include_recipe 'postgresql::add_launch_agent'

db_name = node['workstation']['user']

execute 'create a database for the current user' do
  command "/usr/local/bin/createdb -U #{db_name}"
  user node['workstation']['user']
  not_if "psql -U #{db_name} -c 'select 1' #{db_name} &> /dev/null"
end
