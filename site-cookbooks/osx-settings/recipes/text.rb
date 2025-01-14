prefs = node['workstation']['text']

home_dir = "/Users/#{node['workstation']['user']}"

osx_defaults "#{prefs['automatically_correct_spelling'] ? 'enable' : 'disable'} automatic spelling correction" do
  domain :global
  key 'NSAutomaticSpellingCorrectionEnabled'
  boolean prefs['automatically_correct_spelling']
  only_if { prefs.keys.include?('automatically_correct_spelling') }
end

osx_defaults "#{prefs['automatically_capitalize_words'] ? 'enable' : 'disable'} automatic word capitalization" do
  domain :global
  key 'NSAutomaticCapitalizationEnabled'
  boolean prefs['automatically_capitalize_words']
  only_if { prefs.keys.include?('automatically_capitalize_words') }
end

osx_defaults "#{prefs['automatically_substitute_dashes'] ? 'enable' : 'disable'} automatic dash substitution" do
  domain :global
  key 'NSAutomaticDashSubstitutionEnabled'
  boolean prefs['automatically_substitute_dashes']
  only_if { prefs.keys.include?('automatically_substitute_dashes') }
end

osx_defaults "#{prefs['automatically_substitute_periods'] ? 'enable' : 'disable'} automatic period substitution" do
  domain :global
  key 'NSAutomaticPeriodSubstitutionEnabled'
  boolean prefs['automatically_substitute_periods']
  only_if { prefs.keys.include?('automatically_substitute_periods') }
end

osx_defaults "#{prefs['automatically_substitute_quotes'] ? 'enable' : 'disable'} automatic quote substitution" do
  domain :global
  key 'NSAutomaticQuoteSubstitutionEnabled'
  boolean prefs['automatically_substitute_quotes']
  only_if { prefs.keys.include?('automatically_substitute_quotes') }
end
