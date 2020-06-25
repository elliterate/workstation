ssh_config '*' do
  options(
    'AddKeysToAgent' => 'yes',
    'IdentityFile' => '~/.ssh/id_rsa',
    'UseKeychain' => 'yes',
  )
  user node['workstation']['user']
end
