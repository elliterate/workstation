include_recipe 'homebrew'

package 'go'

bash_it_custom_plugin "bash-it/custom/go.bash" do
  cookbook 'go'
end

oh_my_zsh_custom_script "oh-my-zsh/custom/go.zsh" do
  cookbook 'go'
end
