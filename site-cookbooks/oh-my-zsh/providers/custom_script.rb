use_inline_resources # see http://www.foodcritic.io/#FC017

action :create do
  script_name = ::File.basename(new_resource.source)
  oh_my_zsh_custom_dir = ::File.join(node['oh_my_zsh']['dir'], 'custom')

  template ::File.expand_path(script_name, oh_my_zsh_custom_dir) do
    source new_resource.source
    owner node['workstation']['user']
    variables new_resource.variables
    only_if { script_name =~ /\.zsh$/ && ::File.directory?(oh_my_zsh_custom_dir) }
    cookbook new_resource.cookbook
  end
end
