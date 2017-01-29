include_recipe 'base::bash_it'
include_recipe 'homebrew'

package 'pyenv'

base_bash_it_custom_plugin 'bash_it/custom/pyenv.bash'
