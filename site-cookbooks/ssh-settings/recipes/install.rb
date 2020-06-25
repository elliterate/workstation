ssh_config '*' do
  options(
    'AddKeysToAgent' => 'yes',
    'IdentityFile' => '~/.ssh/id_rsa',
  )
  user node['workstation']['user']
end
