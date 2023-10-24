ssh_config '*' do
  options(
    'AddKeysToAgent' => 'yes',
    'UseKeychain' => 'yes',
  )
  user node['workstation']['user']
end
