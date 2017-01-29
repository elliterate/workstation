include_recipe 'homebrew'

homebrew_root = File.join('/', 'usr', 'local')
data_directory = File.join(homebrew_root, 'var', 'postgres')

package 'postgresql'

directory data_directory do
  action :delete
  recursive true
  not_if { node['workstation']['postgresql']['preserve_dbs'] }
end

# Mixlib::ShellOut incorrectly sets LC_ALL to "c" when installing the
# postgresql Forumala
execute 'recreate database cluster' do
  command "initdb #{data_directory}"
  environment 'LC_ALL' => nil
  user node['workstation']['user']
  not_if { node['workstation']['postgresql']['preserve_dbs'] }
end
