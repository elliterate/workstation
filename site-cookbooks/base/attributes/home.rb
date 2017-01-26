include_attribute 'base::user'

node.default['workstation']['home'] = node['etc']['passwd'][node['workstation']['user']]['dir']
