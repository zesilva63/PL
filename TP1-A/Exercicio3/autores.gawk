#!/usr/bin/gawk -f

BEGIN {
	FS = ":"
	html_start = "<html> <head> <meta charset='UTF-8'/> <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } body{ text-align:center; font-size: 40px; margin-top:20px;}</style> </head> <body>"
    html_end = "</body>\n </html>"
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

	#HTML MAIN


	print html_start > "index.html"
	print "<h1> Projeto 3: Autores Musicais<h1>" > "index.html"
	print "<h2> Processamento de Linguagens</h2>" > "index.html"
	print "<div style=\" margin-top:20px; margin-bottom:20px; text-align:justify;\" class=\"col-md-8 col-md-offset-2\"><h4>Além da coleção de entrevista e fotografias do npMP, o Professor José João Almeida tem uma diretoria (de nome musica, que é anexada em formato ZIP) com dezenas de ficheiros de extensão ’.lyr’ que contêm a letra de canções famosas precedidas de 2 ou mais campos de meta-informação (1 por linha) com o título da canção, o autor da letra (pode ser 1 ou mais pessoas), o cantor, etc. Uma linha em branco separa a meta-informação da letra. Podendo ainda ter em alguns casos um terceiro bloco (igualmente separado da letra por uma linha em branco) com a música escrita na notação midi.</br> Depois de analisar com cuidado o formato desse ficheiro anexo, pretende-se que desenvolva um Processador de Texto com o GAWK para ler todos os ficheiros ’.lyr’ da diretoria musica e: </h4></div>" > "index.html"
	print "<div class=\"col-md-4\">" > "index.html"
	print "<h1><a href=\"indexA.html\"> Alinea A </a></h1>" > "index.html"
	print "<h3> Calcular o total de cantores e a lista com seus nomes</h3>" > "index.html"
	print "</div> <div class=\"col-md-4\">" > "index.html"
	print "<a href=\"indexB.html\"> Alinea B </a>" > "index.html"
	print "</h1><h3>Calcular o total de canções do mesmo autor</h3></h1>" > "index.html"
	print "</div> <div class=\"col-md-4\">" > "index.html"
	print "<h1><a href=\"indexC.html\"> Alinea C </a></h1>" > "index.html"
	print "<h3> Escrever o nome de cada autor seguido do título das suas canções</h3>" > "index.html"
	print "</div>" > "index.html"
	print html_end > "index.html"




	#Alinea A HTML

	print html_start > "indexA.html"
	print "<div style=\"text-align:left; margin-left:20px;\"<h5><a href=\"index.html\"> Voltar </a> </h5></div> " > "indexA.html"
	print "<h1> Alínea A) </h1>" > "indexA.html"
	print "<h2>  Calcular o total de cantores e a lista com seus nomes.</h2>" > "indexA.html"
	print "<h3>Total: <b>"length(cant) "</b></h3>" > "indexA.html"
	for (i in cant) print "<div class=\"col-md-3\" style=\" height: 70px; margin-top: 20px; \"><h3>" i "</h3></div>" > "indexA.html" 
	print html_end > "indexA.html"


	#Alinea B HTML

	print html_start > "indexB.html"
	n=asorti(autor, sorted)
	print "<div style=\"text-align:left; margin-left:20px;\"<h5><a href=\"index.html\"> Voltar </a> </h5></div> " > "indexB.html"
	print "<h1> Alíena B) </h1>" > "indexB.html"
	print "<h2> Calcular o total de canções de cada autor autor.  </h2>" > "indexB.html"
	print "<ul>" > "indexB.html"
	for (i=1; i<=n; i++) {
		 print "<div class=\"col-md-3\" style=\" height: 70px; margin-top: 20px; \"><h3><b>" sorted[i] "</b>:" autor[sorted[i]] "</h3></div>" > "indexB.html"
	}
	print "</ul>" > "indexB.html"
	print "</div>" > "indexB.html"
	print html_end > "indexB.html"


	#Alinea C HTML

	print html_start > "indexC.html"
	print "<div style=\"text-align:left; margin-left:20px;\"<h5><a href=\"index.html\"> Voltar </a> </h5></div> " > "indexC.html"
	print "<h1> Alinea C) </h1>" > "indexC.html"
	print "<h2 style=\"margin-bottom:50px;\"> Escrever o nome de cada autor seguido das suas canções.  </h2>" > "indexC.html"
	print "<div class=\"col-md-8 col-md-offset-2\"> <table style=\"margin-bottom: 40px;\">" > "indexC.html"
		for (i=1; i<=n; i++) {
			print "<tr>" > "indexC.html"
			print "<td><h4 style=\"text-align:center;\"><b>" sorted[i] "</b></h4> </td>" > "indexC.html" 
			print "<td style=\"padding:20px;\">" listaTit[sorted[i]]   "</td>" > "indexC.html"
			print "</tr>" > "index.html"
	}
	
	print "</table></div>" > "indexC.html"
	print html_end > "indexC.html"
}