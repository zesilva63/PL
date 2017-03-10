#!/usr/bin/gawk -f

BEGIN {
	FS = ":"
}

{
	if($1 == "singer"){
	x = split($2,a,";")
	cant[a[1]]++	
	}
}

{
	if($1 == "author"){
		#y = split($2,b,";")
		aut[a]++
		for( q = 0; q <= NF ; q++)
			if ($2 == aut[$2]) {
		   	if ($1 == "author"){
		   	aut[a[$2]]++
		   	}
		}
	}
}

	

END {
	for (i in cant) print i 
	print length(cant)

	#for (j in aut) printf("%s   ->   %s ",aut,length(aut[a]))  
}