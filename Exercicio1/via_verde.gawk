#!/usr/bin/gawk -f

BEGIN {
    PROCINFO["sorted_in"]= "@ind_str_asc";
    html_start = "<html> <head> <meta charset='UTF-8'/>  <style> table, th, td { border: 1px solid black; border-collapse: collapse; } th, td { padding: 5px; } th { text-align: left; } </style> </head> <body>"
    table_locais_start = "<table style=\"width:30%\"> <caption>Locais de Saida</caption> <tr> <th>Local</th> </tr>"
    table_end = "</table> </body> </html> "
    var = 0;
}


# Verificar locais de saida.
match($0,/<SAIDA>(.*)<\/SAIDA>/, l) {
    locais[l[1]]++;
}


{
    if(match($0,/<DATA_ENTRADA>(.*)<\/DATA_ENTRADA>/, d)) {
        if(d[1] != "null")
            days[d[1]]++;

        split(d[1],a,"-");
        meses[var] = a[2];
    }

    if(match($0,/<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, v)) {
        precos[var] = normaliza_float(v[1]);
    }

    if(match($0,/<TIPO>(.*)<\/TIPO>/, t)) {
        tipo[var] = t[1];
    }

    if(match($0,/<\/TRANSACCAO>/))
        var++;
}


END {
print "\nDIAS E RESPETIVAS PASSAGENS: \n"
    for(i in days)
        print controi(i) " -> " days[i] " entradas."

print "\n\nLISTA DE LOCAIS: \n"
    for(i in locais)
        print i

    print "\n";

    for (i = 0;i < var; i++) {
        if(tipo[i] == "Parques de estacionamento") {
            parques += precos[i];
        }
    }

    print "TOTAL EM PARQUES: " parques;
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

function controi(data) {
    split(data,a,"-");
    return a[1] " de " get_mes(a[2]) a[3];
}
