function f --description "Find shorthand"
	grc find . -name "$argv" 2>&1 | grep -v 'Permission denied'
end