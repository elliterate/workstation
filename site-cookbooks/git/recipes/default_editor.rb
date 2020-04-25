include_recipe 'bash-it'

bash_it_custom_plugin 'bash-it/custom/git-export_editor.bash' do
  variables editor: node['workstation']['git']['editor']
end
