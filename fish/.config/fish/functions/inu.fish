function inu
		nuclei -u $argv[1] | tee $(date -I date)-$argv[1]
end
