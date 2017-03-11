#!/usr/bin/gawk -f

@include "functions.gawk"

BEGIN {
    PROCINFO["sorted_in"]= "@ind_str_asc";

    html_start = "<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>"
    html_end = "</body> </html>"
    table_locais_start = "<table style=\"width:30%\"> <caption>Locais de Saida</caption> <tr> <th>Local</th> </tr>"
    table_entradas_start = "<table style=\"width:30%\"> <caption>Entradas de cada dia</caption> <tr> <th>Dia</th> <th>Nr de Entradas</th> </tr>"
    table_viagens_start = "<table style=\"width:30%\"> <caption>Viagens efetuadas no mês por percurso</caption> <tr> <th>Percurso</th> <th>Nr de Viagens</th> </tr>"
    table_end = "</table>"

    var = 0;
}


{
    if(match($0,/<NOME>(.*)<\/NOME>/, n)) {
        nome = n[1];
    }

    if(match($0,/<ENTRADA>(.*)<\/ENTRADA>/, en)) {
        entrada[var] = en[1];
    }

    if(match($0,/<SAIDA>(.*)<\/SAIDA>/, l)) {
        locais[l[1]]++;
        saida[var] = l[1];
    }

    if(match($0,/<DATA_ENTRADA>(.*)<\/DATA_ENTRADA>/, d)) {
        if(d[1] != "null")
            dias[reordena(d[1])]++;

        split(d[1],a,"-");
        meses[var] = a[2];
    }

    if(match($0,/<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, v)) {
        precos[var] = normaliza_float(v[1]);
    }

    if(match($0,/<TIPO>(.*)<\/TIPO>/, t)) {
        tipo[var] = t[1];
    }

    if(match($0,/<\/TRANSACCAO>/)) {
        var++;
    }
}


END {

    for (i = 0;i < var; i++) {
        total[meses[i]] += precos[i];

        if(tipo[i] == "Parques de estacionamento") {
            parques += precos[i];
        }
        if(length(entrada[i]) > 0 && length(saida[i]) > 0) {
            viagens[entrada[i]" - "saida[i]]++;
        }
    }

    print html_start > "index.html"
    print "<h1 align=\"center\"> Extracto Mensal Via Verde </h1> <hr> " > "index.html"
    print "<h3> Nome </h3> " > "index.html"
    print "<p> " nome "</p> " > "index.html"
    print "<hr> <h3> Opções </h3>" > "index.html"
    print "<li> <a href='entradas.html'> Número de Entradas por dia do mês </a></li>\n" > "index.html"
    print "<li> <a href='locais.html'> Lista de Locais de Saida </a></li>\n" > "index.html"
    print "<li> <a href='viagens.html'> Estatisticas sobre Viagens </a></li>\n" > "index.html"
    print "<hr> <h3> Gastos Efetuados </h3> " > "index.html"
    for(p in total) {
        if(length(p) > 0)
            print "<p> Total gasto em " get_mes(p) ": " total[p] " </p> " > "index.html"
        else print "<p> Total gasto sem especificação da data: " total[p] " </p>" > "index.html"
    }
    print "<p> Gastos em Parques: " parques " </p>" > "index.html"
    print html_end > "index.html"


    print html_start > "entradas.html"
    print "<h1> Lista de Entradas por dia </h1>  <hr>" > "entradas.html"
    print table_entradas_start > "entradas.html"
    for(e in dias)
        print "<tr> <td> " controi(e) " </td> <td> " dias[e] "</td> </tr>" > "entradas.html"
    print table_end > "entradas.html"
    print html_end > "entradas.html"


    print html_start > "locais.html"
    print "<h1> Lista de Locais de Saida </h1> <hr>" > "locais.html"
    print table_locais_start > "locais.html"
    for(i in locais)
        print "<tr> <td>" i "</td> </tr>" > "locais.html"
    print table_end > "locais.html"
    print html_end > "locais.html"


    print html_start > "viagens.html"
    print "<h1> Estatisticas sobre viagens </h1> <hr>" > "viagens.html"
    print table_viagens_start > "viagens.html"
    for(viagem in viagens)
        print "<tr> <td>" viagem "</td> <td>" viagens[viagem] "</td> </tr>" > "viagens.html"
    print table_end > "viagens.html"
    print html_end > "viagens.html"


    }
