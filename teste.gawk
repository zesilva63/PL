#!/usr/bin/gawk -f

BEGIN {

}

# Verificar entradas em cada dia do mês.
{
    match($0,/<DATA_ENTRADA>(.*)<\/DATA_ENTRADA>/, d);
    split(d[1],a,"-");
    days[d[1]]++;
}

# Verificar locais de saida.
{
    match($0,/<SAIDA>(.*)<\/SAIDA>/, l);
    locais[l[1]]++;
}

# Verificar total gasto em parques.
{

}

END {
#    for(i in days)
#        print i " -> " days[i]

#    for(i in locais)
#        print i
}
