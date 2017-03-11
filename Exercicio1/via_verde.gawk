#!/usr/bin/gawk -f

BEGIN {
    PROCINFO["sorted_in"]= "@ind_str_asc";
    html_start = "<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>"
    table_locais_start = "<table style=\"width:30%\"> <caption>Locais de Saida</caption> <tr> <th>Local</th> </tr>"
    table_entradas_start = "<table style=\"width:30%\"> <caption>Entradas de cada dia</caption> <tr> <th>Dia</th> <th>Nr de Entradas</th> </tr>"
    table_end = "</table>"
    html_end = "</body> </html>"
    r_script = "#!/usr/bin/Rscript\n\nentradas <- function(){\ndia.entradas <- c(%s)\nbarplot(dia.entradas,main = \"Entradas em cada dia\")\n}\n\nentradas()"

    var = 0;
}


# Verificar locais de saida.
match($0,/<SAIDA>(.*)<\/SAIDA>/, l) {
    locais[l[1]]++;
}


{
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
    print html_start > "index.html"
    print "<li> <a href='entradas.html'> Número de Entradas por dia do mês </a></li>\n" > "index.html"
    print "<li> <a href='locais.html'> Lista de Locais de Saida </a></li>\n" > "index.html"
    print html_end > "index.html"

    print html_start > "entradas.html"
    print "<h1> Lista de Entradas por dia </h1>" > "entradas.html"
    print table_entradas_start > "entradas.html"
    for(e in dias)
        print "<tr> <td> " controi(e) " </td> <td> " dias[e] "</td> </tr>" > "entradas.html"
    print table_end > "entradas.html"
    print html_end > "entradas.html"


#    print "\nDIAS E RESPETIVAS PASSAGENS: \n"
#        for(dia in dias)
#            print get_dia(dia)
#    printf (r_script,valores) > "tabela.R";

#    for(i in days)
#        print controi(i) " -> " days[i] " passagens."


    print html_start > "locais.html"
    print "<h1> Lista de Locais de Saida </h1>" > "locais.html"
    print table_locais_start > "locais.html"
    for(i in locais)
        print "<tr> <td>" i "</td> </tr>" > "locais.html"
    print table_end > "locais.html"
    print html_end > "locais.html"


#    print "\n";
#
#    for (i = 0;i < var; i++) {
#        if(tipo[i] == "Parques de estacionamento") {
#            parques += precos[i];
#        }
#    }
#
#    print "TOTAL EM PARQUES: " parques;
}


# Substitui "," por "." na importância para poderem ser efetuadas contas sobre o valor.
function normaliza_float(num) {
    gsub(/,/, ".",num)
    return num;
}


function get_mes(valor) {
    mes["01"] = "Janeiro de ";
    mes["02"] = "Fevereiro de ";
    mes["03"] = "Março de ";
    mes["04"] = "Abril de ";
    mes["05"] = "Maio de ";
    mes["06"] = "Junho de ";
    mes["07"] = "Julho de ";
    mes["08"] = "Agosto de ";
    mes["09"] = "Setembro de ";
    mes["10"] = "Outubro de ";
    mes["11"] = "Novembro de ";
    mes["12"] = "Dezembro de ";
    return mes[valor];
}

function get_dia(data) {
    split(data,a,"-");
    return a[3]
}


function controi(data) {
    split(data,a,"-");
    return a[3] " de " get_mes(a[2]) a[1];
}

function reordena(data) {
    split(data,a,"-");
    return a[3] "-" a[2] "-" a[1]
}
