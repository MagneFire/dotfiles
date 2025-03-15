function adbr --wraps='adb wait-for-device ; and adb reboot' --description 'alias adbr=adb wait-for-device ; and adb reboot'
  adb wait-for-device ; and adb reboot $argv; 
end
