include_recipe 'postgresql::install_postgres'

execute 'start postgresql' do
  command 'brew services start postgresql'
  user node['workstation']['user']
end

ruby_block 'wait four seconds for the database to start' do
  block do
    sleep 4
  end
end
