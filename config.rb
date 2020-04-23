root = File.absolute_path(File.dirname(__FILE__))

file_cache_path File.join(ENV['HOME'], '.cache', 'chef')
cookbook_path File.join(root, 'cookbooks')
ohai.optional_plugins = [
  :Passwd,
] if ohai
