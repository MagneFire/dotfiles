function adbj --wraps='adbs "journalctl -afe"' --description 'alias adbj=adbs "journalctl -afe"'
  adbs "journalctl -afe" $argv; 
end
