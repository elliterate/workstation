
node['shell-settings']['bash-it']['custom_plugins'].each do |custom_plugin|
  base_bash_it_custom_plugin "bash-it/custom/#{custom_plugin}" do
    cookbook 'shell-settings'
  end
end

node['shell-settings']['oh-my-zsh']['custom_scripts'].each do |custom_script|
  base_oh_my_zsh_custom_script "oh-my-zsh/custom/#{custom_script}" do
    cookbook 'shell-settings'
  end
end
