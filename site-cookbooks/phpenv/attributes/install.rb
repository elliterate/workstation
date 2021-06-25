include_attribute 'base::home'

node.default['versions']['phpenv'] = 'HEAD'
node.default['phpenv'] = {
  'dir' => ::File.expand_path('.phpenv', node['workstation']['home']),
  'repository' => 'https://github.com/phpenv/phpenv.git',
}

node.default['versions']['php-build'] = 'HEAD'
node.default['php-build'] = {
  'dir' => ::File.expand_path('.phpenv/plugins/php-build', node['workstation']['home']),
  'repository' => 'https://github.com/php-build/php-build.git',
}
