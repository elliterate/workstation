template_dir = "#{node['workstation']['home']}/.git-template"

remote_directory template_dir do
  source 'git-template'
  files_owner node['workstation']['user']
  files_mode '755'
  recursive true
end

git_config 'init.templateDir' do
  setting_value template_dir
  scope :global
end
