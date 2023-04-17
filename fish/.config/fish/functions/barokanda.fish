function barokanda
		frida -U -f (frida-ps -Uai | grep -i $argv[1] | awk -F ' ' '{print $NF}') $argv[2..-1]
end
