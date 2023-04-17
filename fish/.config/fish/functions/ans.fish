function ans
	if test (count $argv) -gt 0
		frida-ps -Uai | grep -i $argv
	else
		frida-ps -U
	end
end
