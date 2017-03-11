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
	x = split($2,b,";")
	autor[b[1]]++
	}
}


#{
#	if($1 == "author"){
#		#y = split($2,b,";")
#		aut[a]++
#		for( q = 0; q <= NF ; q++)
#			if ($2 == aut[$2]) {
#		   	if ($1 == "author"){
#		   	aut[a[$2]]++
#		   	}
#		}
#	}
#}

	

END {
	print "<meta charset=\"UTF-8\">"
	
	#Alinea A HTML

	print "<h1> Alinea A) </h1>"
	print "<h2>  Calcular o total de cantores e a lista com seus nomes.</h2>"
	print "Total: <b>"length(cant) "</b>"
	print "<ol>"
	for (i in cant) print "<li>-<b>" i "</b></li>" 
	print "</ol>"
	


	#Alinea B HTML

	n=asorti(autor, sorted)
	print "<h1> Aliena B) </h1>"
	print "<h2> Calcular o total de canções do mesmo autor.  </h2>"
	print "<ul>"
	for (i=1; i<=n; i++) {
		 print "<li><b>" sorted[i] "</b> : " autor[sorted[i]] "</li>"
	}
	print "</ul>"


	#for (j in aut) printf("%s   ->   %s ",aut,length(aut[a]))  
}