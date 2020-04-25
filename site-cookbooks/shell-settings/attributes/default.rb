include_attribute 'base::bin_directory'

node.default['shell-settings'] = {
  'bash-it' => {
    'custom_plugins' => [
      'aliases.bash',
      'bin.bash',
      'colors.bash',
      'editor.bash'
  	]
  },
  'oh-my-zsh' => {
    'custom_scripts' => [
      'aliases.zsh',
      'bin.zsh',
      'colors.zsh',
      'editor.zsh'
  	]
  }
}
