include_attribute 'base::home'

node.default['versions']['oh_my_zsh'] = 'HEAD'
node.default['oh_my_zsh'] = {
  'custom_scripts' => {},
  'dir' => ::File.expand_path('.oh-my-zsh', node['workstation']['home']),
  'repository' => 'https://github.com/ohmyzsh/ohmyzsh',
  'theme' => 'robbyrussell',
  'zshrc_path' => ::File.expand_path('.zshrc', node['workstation']['home'])
}
