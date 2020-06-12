sudo_path = '/etc/pam.d/sudo'

execute 'prepend Touch ID PAM module' do
  command <<~CMD
    sed -i '' '1i\\
    auth sufficient pam_tid.so
    ' #{sudo_path}
  CMD
  not_if "grep -q pam_tid.so #{sudo_path}"
end
