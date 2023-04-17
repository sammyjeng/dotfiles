function get_pkg_pid
	get_pkg_details $argv | awk '{print $argv}'
end
