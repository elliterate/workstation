include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

package 'pyenv'

bash_it_custom_plugin 'bash-it/custom/pyenv.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/pyenv.zsh'
