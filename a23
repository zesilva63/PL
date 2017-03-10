#!/usr/bin/gawk -f

BEGIN {
	FS = ":"
}

{
	if($1 == "singer"){
	x = split($2,a,";")

	aut[a[1]]++
	}
	


}

END {
	for (i in aut) print i 
	print length(aut)
}