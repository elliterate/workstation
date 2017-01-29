homebrew_cask 'iterm2'

cookbook_file "/Users/#{node['workstation']['user']}/Library/Preferences/com.googlecode.iterm2.plist" do
  source 'com.googlecode.iterm2.plist'
  user node['workstation']['user']
  mode '0600'
end
