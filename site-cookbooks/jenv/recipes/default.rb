include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

package 'jenv'

bash_it_custom_plugin 'bash-it/custom/jenv.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/jenv.zsh'
