include_attribute 'base::home'

node.default['versions']['goenv'] = 'HEAD'
node.default['goenv'] = {
  'dir' => ::File.expand_path('.goenv', node['workstation']['home']),
  'repository' => 'https://github.com/syndbg/goenv.git',
}
