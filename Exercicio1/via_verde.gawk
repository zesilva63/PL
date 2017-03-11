#!/usr/bin/gawk -f

@include "functions.gawk"

BEGIN {
    PROCINFO["sorted_in"]= "@ind_str_asc";
    var = 0;
}

{
    if(match($0,/<NOME>(.*)<\/NOME>/, n))
        nome = n[1];

    if(match($0,/<ENTRADA>(.*)<\/ENTRADA>/, en))
        entrada[var] = en[1];

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

    if(match($0,/<IMPORTANCIA>(.*)<\/IMPORTANCIA>/, v))
        precos[var] = normaliza_float(v[1]);

    if(match($0,/<TIPO>(.*)<\/TIPO>/, t))
        tipo[var] = t[1];

    if(match($0,/<\/TRANSACCAO>/))
        var++;
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
}
