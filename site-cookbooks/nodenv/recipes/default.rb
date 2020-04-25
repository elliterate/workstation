include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

package 'nodenv'

bash_it_custom_plugin 'bash-it/custom/nodenv.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/nodenv.zsh'
