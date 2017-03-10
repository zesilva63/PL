#!/usr/bin/gawk -f

BEGIN {
    PROCINFO["sorted_in"]= "@ind_str_asc";
    var = 0;
}

# Verificar entradas em cada dia do mês.
match($0,/<DATA_ENTRADA>(.*)<\/DATA_ENTRADA>/, d) {
    if(d[1] != "null") {
        split(d[1],a,"-");
        days[d[1]]++;
    }
}

# Verificar locais de saida.
match($0,/<SAIDA>(.*)<\/SAIDA>/, l) {
    locais[l[1]]++;
}

# Verificar total gasto em parques.
{
    match($0,/<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, v);
    if(length(v[1]) > 0) {
        gsub(/,/, ".",v[1]);
        precos[var] = v[1];
    }
    match($0,/<TIPO>(.*)<\/TIPO>/, t);
    if(length(t[1]) > 1) {
        tipo[var] = t[1];
        var++;
    }
}

END {
print "\nDIAS E RESPETIVAS PASSAGENS: \n"
    for(i in days)
        print i " -> " days[i]

print "\nLISTA DE LOCAIS: \n"
    for(i in locais)
        print i
    print sum;

    for (i = 0;i < var; i++) {
        if(tipo[i] == "Parques de estacionamento") {
            parques += precos[i];
        }
    }
    print "TOTAL EM PARQUES: " parques;
}
