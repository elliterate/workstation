include_recipe 'base::bash_it'
include_recipe 'homebrew'

package 'rbenv'
package 'ruby-build'

base_bash_it_custom_plugin 'bash_it/custom/rbenv.bash'
