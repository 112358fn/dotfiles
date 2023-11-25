
function repo -w ghq
    if test (count $argv) =  0
    	if set -f  proj ( ghq list --exact | fzf)
			cd (ghq list --exact --full-path $proj)
		end
	else
		ghq $argv
    end
end
