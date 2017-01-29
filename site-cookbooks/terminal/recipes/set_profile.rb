include_recipe 'terminal::check_for_active'
term_opts = node['workstation']['terminal']
domain = 'com.apple.Terminal'

osx_defaults "set terminal profile to #{term_opts['default_profile']}" do
  domain domain
  key 'Default Window Settings'
  string term_opts['default_profile']
end

osx_defaults "set startup terminal profile to #{term_opts['default_profile']}" do
  domain domain
  key 'Startup Window Settings'
  string term_opts['default_profile']
end
