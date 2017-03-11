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

/^title/{
	title = $2;
}

{
	if($1 == "author"){ 
		if(listaTit[$2] == null) {
			listaTit[$2] = title;
		}
		else {
			listaTit[$2] = listaTit[$2] " , " title;
		}
	}

}


	

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


	#Alinea C HTML

	print "<h1> Alinea C) </h1>"
	print "<h2> Escrever o nome de cada autor seguido das suas canções.  </h2>"
	print "<ul>"
		for (i=1; i<=n; i++) {
		 print "<li><b>" sorted[i] "</b> : " listaTit[sorted[i]]   "</li>"
	}

	print "</ul>"



}