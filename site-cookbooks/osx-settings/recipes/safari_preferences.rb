prefs = node['workstation']['safari_preferences']

osx_defaults "set auto-fill credit card data to #{prefs['auto_fill_credit_card_data']}" do
  domain 'com.apple.Safari'
  key 'AutoFillCreditCardData'
  boolean prefs['auto_fill_credit_card_data']
  only_if { prefs.keys.include?('auto_fill_credit_card_data') }
end

osx_defaults "set auto-fill passwords to #{prefs['auto_fill_passwords']}" do
  domain 'com.apple.Safari'
  key 'AutoFillPasswords'
  boolean prefs['auto_fill_passwords']
  only_if { prefs.keys.include?('auto_fill_passwords') }
end

osx_defaults "set auto-open safe downloads to #{prefs['auto_open_safe_downloads']}" do
  domain 'com.apple.Safari'
  key 'AutoOpenSafeDownloads'
  boolean prefs['auto_open_safe_downloads']
  only_if { prefs.keys.include?('auto_open_safe_downloads') }
end

osx_defaults "set always show tab bar to #{prefs['always_show_tab_bar']}" do
  domain 'com.apple.Safari'
  key 'AlwaysShowTabBar'
  boolean prefs['always_show_tab_bar']
  only_if { prefs.keys.include?('always_show_tab_bar') }
end

osx_defaults "set home page to #{prefs['home_page']}" do
  domain 'com.apple.Safari'
  key 'HomePage'
  string prefs['home_page']
  only_if { prefs.keys.include?('home_page') }
end
