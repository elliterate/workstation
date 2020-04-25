include_attribute 'base::home'

node.default['versions']['bash-it'] = 'HEAD'
node.default['bash-it'] = {
  'enabled_plugins' => {
    'plugins' => %w(base)
  },
  'custom_plugins' => {},
  'theme' => 'powerline',
  'dir' => ::File.expand_path('.bash_it', node['workstation']['home']),
  'bashrc_path' => ::File.expand_path('.bash_profile', node['workstation']['home']),
  'repository' => 'https://github.com/Bash-it/bash-it'
}
