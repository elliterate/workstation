include_recipe 'bash-it'
include_recipe 'homebrew'

package 'nodenv'

bash_it_custom_plugin 'bash-it/custom/nodenv.bash'
