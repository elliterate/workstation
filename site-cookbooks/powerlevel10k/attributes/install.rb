include_attribute 'oh-my-zsh::install'

node.default['versions']['powerlevel10k'] = 'HEAD'
node.default['powerlevel10k'] = {
  'dir' => "#{node['oh_my_zsh']['dir']}/custom/themes/powerlevel10k",
  'repository' => 'https://github.com/romkatv/powerlevel10k',
}
