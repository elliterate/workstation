include_attribute 'base::bin_directory'
include_attribute 'git'

node.default['shell-settings'] = {
  'bash-it' => {
    'custom_plugins' => [
      'aliases.bash',
      'bin.bash',
      'colors.bash',
      'editor.bash',
      'git_editor.bash',
      'history.bash',
      'pager.bash',
    ]
  },
  'oh-my-zsh' => {
    'custom_scripts' => [
      'aliases.zsh',
      'bin.zsh',
      'colors.zsh',
      'editor.zsh',
      'git_editor.zsh',
      'history.zsh',
      'keybindings.zsh',
      'pager.zsh',
    ]
  }
}
