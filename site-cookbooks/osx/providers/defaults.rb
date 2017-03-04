require 'shellwords'

action :write do
  execute "#{new_resource.description} - #{new_resource.domain} - #{new_resource.key}"  do
    command "defaults write #{new_resource.domain} #{default}"
    user node['workstation']['user']
    not_if "defaults read #{new_resource.domain} #{default.key} | grep ^#{default.value}$"
  end
end

def default
  return IntSerializer.new(new_resource.key, new_resource.integer) if new_resource.integer
  return ArraySerializer.new(new_resource.key, new_resource.array) if new_resource.array
  return StringSerializer.new(new_resource.key, new_resource.string) if new_resource.string
  return FloatSerializer.new(new_resource.key, new_resource.float) if new_resource.float
  return DictSerializer.new(new_resource.key, new_resource.dict) if new_resource.dict
  return BooleanSerializer.new(new_resource.key, new_resource.boolean) unless new_resource.boolean.nil?
  nil
end
