function aenv
	if test (count $argv) -gt 0
		source	$argv"/bin/activate.fish"
	else
		deactivate
	end
end
