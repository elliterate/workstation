include_recipe 'base::bash_it'
include_recipe 'homebrew'

package 'nodenv'

base_bash_it_custom_plugin 'bash_it/custom/nodenv.bash'
