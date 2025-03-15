function adbrb --wraps='adb wait-for-device ; and adb reboot bootloader' --description 'alias adbrb=adb wait-for-device ; and adb reboot bootloader'
  adb wait-for-device ; and adb reboot bootloader $argv; 
end
