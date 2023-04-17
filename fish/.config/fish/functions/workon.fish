function workon
	if test (count $argv) -gt 0
			source ~/.virtualenvs/$argv/bin/activate.fish
	end
end
