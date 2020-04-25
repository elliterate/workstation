include_recipe 'bash-it'
include_recipe 'homebrew'

package 'rbenv'
package 'ruby-build'

bash_it_custom_plugin 'bash-it/custom/rbenv.bash'
