include_attribute 'base::home'

node.default['versions']['bash_it'] = 'HEAD'
node.default['bash_it'] = {
  'enabled_plugins' => {
    'plugins' => %w(base)
  },
  'custom_plugins' => {
    'base' => %w(
      bash_it/custom/aliases.bash
      bash_it/custom/colors.bash
      bash_it/custom/editor.bash
    )
  },
  'theme' => 'powerline',
  'dir' => ::File.expand_path('.bash_it', node['workstation']['home']),
  'bashrc_path' => ::File.expand_path('.bash_profile', node['workstation']['home']),
  'repository' => 'https://github.com/Bash-it/bash-it'
}
