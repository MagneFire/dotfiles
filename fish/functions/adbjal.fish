function adbjal --wraps=adbs\ \"journalctl\ -afe\ \|\ grep\ \\\"asteroid-launcher\\\[\\\"\" --description alias\ adbjal=adbs\ \"journalctl\ -afe\ \|\ grep\ \\\"asteroid-launcher\\\[\\\"\"
  adbs "journalctl -afe | grep \"asteroid-launcher\[\"" $argv; 
end
