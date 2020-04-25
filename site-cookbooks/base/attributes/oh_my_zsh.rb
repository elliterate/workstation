include_attribute 'base::home'

node.default['versions']['oh_my_zsh'] = 'HEAD'
node.default['oh_my_zsh'] = {
  'custom_scripts' => {
    'base' => %w(
      oh_my_zsh/custom/aliases.zsh
      oh_my_zsh/custom/bin.zsh
      oh_my_zsh/custom/colors.zsh
      oh_my_zsh/custom/editor.zsh
    )
  },
  'dir' => ::File.expand_path('.oh-my-zsh', node['workstation']['home']),
  'repository' => 'https://github.com/ohmyzsh/ohmyzsh',
  'theme' => 'agnoster',
  'zshrc_path' => ::File.expand_path('.zshrc', node['workstation']['home'])
}
