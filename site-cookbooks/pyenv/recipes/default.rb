include_recipe 'bash-it'
include_recipe 'homebrew'

package 'pyenv'

bash_it_custom_plugin 'bash-it/custom/pyenv.bash'
