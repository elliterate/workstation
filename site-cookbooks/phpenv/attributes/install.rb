include_attribute 'base::home'

node.default['versions']['phpenv'] = 'HEAD'
node.default['phpenv'] = {
  'dir' => ::File.expand_path('.phpenv', node['workstation']['home']),
  'repository' => 'https://github.com/phpenv/phpenv.git',
}
