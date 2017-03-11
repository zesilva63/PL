#!/usr/bin/gawk -f

@include "via_verde.gawk"

BEGIN {
    html_start = "<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>"
    html_end = "</body>\n </html>"
    table_locais_start = "<table style=\"width:30%\"> <caption>Locais de Saida</caption> <tr> <th>Local</th> </tr>"
    table_entradas_start = "<table style=\"width:30%\"> <caption>Entradas de cada dia</caption> <tr> <th>Dia</th> <th>Nr de Entradas</th> </tr>"
    table_viagens_start = "<table style=\"width:30%\"> <caption>Viagens efetuadas no mês por percurso</caption> <tr> <th>Percurso</th> <th>Nr de Viagens</th> </tr>"
    table_end = "</table>\n"
    h1 = "<h1> %s </h1> <hr>\n"
    h3 = "<hr> <h3> %s </h3>\n\n"
    h4 = "<h4> %s </h4>\n"
    par = "<p> %s </p>"
    link = "<li> <a href='%s'> %s </a></li>\n"
}

END {
    print html_start > "index.html"
    print "<h1 align=\"center\"> Extracto Mensal Via Verde </h1> <hr> " > "index.html"
    printf(h3,"Cliente") > "index.html"
    printf(h4,"Nome") > "index.html"
    printf(par,nome) > "index.html"
    printf(h3,"Opções") > "index.html"
    printf(link,"entradas.html","Número de Entradas por dia do mês") > "index.html"
    printf(link,"locais.html","Lista de Locais de Saida")  > "index.html"
    printf(link,"viagens.html","Estatisticas sobre Viagens")  > "index.html"
    printf(h3,"Gastos Efetuados") > "index.html"
    for(p in total) {
        if(length(p) > 0)
            print "<p> Total gasto em " get_mes(p) ": " total[p] " </p> " > "index.html"
        else print "<p> Total gasto sem especificação da data: " total[p] " </p>" > "index.html"
    }
    print "<p> Gastos em Parques: " parques " </p>" > "index.html"
    print html_end > "index.html"


    print html_start > "entradas.html"
    printf (h1,"Lista de Entradas por dia") > "entradas.html"
    print table_entradas_start > "entradas.html"
    for(e in dias)
        print "<tr> <td> " controi(e) " </td> <td> " dias[e] "</td> </tr>" > "entradas.html"
    print table_end > "entradas.html"
    print html_end > "entradas.html"


    print html_start > "locais.html"
    printf (h1,"Lista de Locais de Saida") > "locais.html"
    print table_locais_start > "locais.html"
    for(i in locais)
        print "<tr> <td>" i "</td> </tr>" > "locais.html"
    print table_end > "locais.html"
    print html_end > "locais.html"


    print html_start > "viagens.html"
    printf (h1,"Estatisticas sobre viagens") > "viagens.html"
    print table_viagens_start > "viagens.html"
    for(viagem in viagens)
        print "<tr> <td>" viagem "</td> <td>" viagens[viagem] "</td> </tr>" > "viagens.html"
    print table_end > "viagens.html"
    print html_end > "viagens.html"

}
