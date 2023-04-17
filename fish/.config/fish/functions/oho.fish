function oho
		objection -g (frida-ps -Uai | grep -i $argv[1] | awk -F ' ' '{print $NF}') explore -s $argv[2..-1]
end
