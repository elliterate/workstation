osx_defaults 'disable rich text in new TextEdit documents' do
  domain 'com.apple.TextEdit'
  key 'RichText'
  boolean false
end

osx_defaults 'disable text replacement in new TextEdit documents' do
  domain 'com.apple.TextEdit'
  key 'TextReplacement'
  boolean false
end
