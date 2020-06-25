ssh_config '*' do
  options(
    'IdentityFile' => '~/.ssh/id_rsa',
  )
  user node['workstation']['user']
end
