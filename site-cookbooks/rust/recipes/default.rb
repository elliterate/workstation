include_recipe 'homebrew'

package 'rust'

bash_it_custom_plugin "bash-it/custom/rust.bash" do
  cookbook 'rust'
end

oh_my_zsh_custom_script "oh-my-zsh/custom/rust.zsh" do
  cookbook 'rust'
end
