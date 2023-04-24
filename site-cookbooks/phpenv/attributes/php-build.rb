include_attribute 'base::home'

node.default['versions']['php-build'] = 'HEAD'
node.default['php-build'] = {
  'dir' => ::File.join(node['phpenv']['dir'], 'plugins', 'php-build'),
  'repository' => 'https://github.com/php-build/php-build.git',
}
