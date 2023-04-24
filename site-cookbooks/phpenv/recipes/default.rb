include_recipe 'bash-it'
include_recipe 'homebrew'
include_recipe 'oh-my-zsh'

include_recipe 'phpenv::install'
include_recipe 'phpenv::php-build'

bash_it_custom_plugin 'bash-it/custom/phpenv.bash'
oh_my_zsh_custom_script 'oh-my-zsh/custom/phpenv.zsh'
