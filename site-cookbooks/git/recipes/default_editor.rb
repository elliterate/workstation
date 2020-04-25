include_recipe 'bash-it'
include_recipe 'oh-my-zsh'

bash_it_custom_plugin 'bash-it/custom/git-export_editor.bash' do
  variables editor: node['workstation']['git']['editor']
end

oh_my_zsh_custom_script 'oh-my-zsh/custom/git_editor.zsh'
