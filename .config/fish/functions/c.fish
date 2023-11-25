
function c -w cd
	if test (count $argv) =  0
	    if set -f root (git rev-parse --show-toplevel 2>/dev/null)
			cd $root
		else
			cd
		end
	else
		cd $argv[1]
    end
end
