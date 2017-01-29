node.default['versions']['vim-config'] = 'HEAD'
node.default['vim']['config'] = {
  'dir' => ::File.expand_path('.vim', node['workstation']['home']),
  'repository' => 'https://github.com/elliterate/vim-config.git'
}
