function adbs --wraps='adb wait-for-device ; and adb shell' --description 'alias adbs=adb wait-for-device ; and adb shell'
  adb wait-for-device ; and adb shell $argv; 
end
