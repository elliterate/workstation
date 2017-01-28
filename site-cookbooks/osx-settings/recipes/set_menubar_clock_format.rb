clock_format = node['workstation']['settings']['clock_format']
osx_defaults 'set menubar clock format' do
  domain 'com.apple.menuextra.clock'
  key 'DateFormat'
  string clock_format
end

execute 'relaunch menubar' do
  command 'killall -KILL SystemUIServer'
  ignore_failure true
  only_if { !clock_format.nil? && !clock_format.empty? }
end
