include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

include_recipe 'goenv::install'

bash_it_custom_plugin 'bash-it/custom/goenv.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/goenv.zsh'
