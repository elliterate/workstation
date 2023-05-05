require 'shellwords'

osx_defaults 'enable full keyboard access for all controls' do
  # from http://knoopx.net/os-x-lion-tweaks
  domain 'NSGlobalDomain'
  key 'AppleKeyboardUIMode'
  integer 3
end

disabled_keyboard_shortcut_xml =
  <<~XML
    <dict>
      <key>enabled_context_menu</key>
      <false/>
      <key>enabled_services_menu</key>
      <false/>
      <key>presentation_modes</key>
      <dict>
        <key>ContextMenu</key>
        <false/>
        <key>ServicesMenu</key>
        <false/>
      </dict>
    </dict>
  XML

disabled_service_keyboard_shortcut_keys = [
  'com.apple.Safari - Search With %WebSearchProvider@ - searchWithWebSearchProvider',
  'com.apple.Terminal - Search man Page Index in Terminal - searchManPages',
]

disabled_service_keyboard_shortcut_keys.each do |key|
  execute "disable #{key.inspect} service keyboard shortcut" do
    command "defaults write pbs NSServicesStatus -dict-add #{Shellwords.escape(key)} #{Shellwords.escape(disabled_keyboard_shortcut_xml)}"
    user node['workstation']['user']
  end
end
