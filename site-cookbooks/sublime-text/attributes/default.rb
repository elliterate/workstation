include_attribute 'base::home'
include_attribute 'base::user'

node.default['sublime-text'] = {
  'settings' => {
    'dir' => "#{node['workstation']['home']}/Library/Application Support/Sublime Text 3"
  }
}
