zoom_hotkey_domain = 'us.zoom.xos.Hotkey'

osx_defaults 'set Zoom "toggle audio" shortcut' do
  domain zoom_hotkey_domain
  key '[HK@combo]-HotkeyOnOffAudio'

  # CTL-OPT-CMD-A
  dict 'hot key code' => 0, 'hot key modifier' => 1835008
end

osx_defaults 'enable global Zoom "toggle audio" shortcut' do
  domain zoom_hotkey_domain
  key '[gHK@state]-HotkeyOnOffAudio'
  boolean true
end

osx_defaults 'set Zoom "toggle video" shortcut' do
  domain zoom_hotkey_domain
  key '[HK@combo]-HotkeyOnOffVideo'

  # CTL-OPT-CMD-V
  dict 'hot key code' => 9, 'hot key modifier' => 1835008
end

osx_defaults 'enable global Zoom "toggle video" shortcut' do
  domain zoom_hotkey_domain
  key '[gHK@state]-HotkeyOnOffVideo'
  boolean true
end
