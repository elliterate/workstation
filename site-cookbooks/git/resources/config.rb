property :setting_key, String, name_attribute: true
property :setting_value, [String, Integer]
property :setting_owner, String, default: node['workstation']['user']
property :scope, is: [:system, :global], default: :global

default_action :create

action :create do
  execute "git config --#{new_resource.scope} #{new_resource.setting_key} #{new_resource.setting_value}" do
    user new_resource.setting_owner
  end
end
