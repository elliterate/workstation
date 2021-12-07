include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

package 'asdf'

bash_it_custom_plugin 'bash-it/custom/asdf.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/asdf.zsh'
