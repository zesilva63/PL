#!/usr/bin/gawk -f

function normaliza_float(num) {
    gsub(/,/, ".",num)
    return num;
}

function get_mes(valor) {
    mes["01"] = "Janeiro";
    mes["02"] = "Fevereiro";
    mes["03"] = "Março";
    mes["04"] = "Abril";
    mes["05"] = "Maio";
    mes["06"] = "Junho";
    mes["07"] = "Julho";
    mes["08"] = "Agosto";
    mes["09"] = "Setembro";
    mes["10"] = "Outubro";
    mes["11"] = "Novembro";
    mes["12"] = "Dezembro";
    return mes[valor];
}

function controi(data) {
    split(data,a,"-");
    return a[3] " de " get_mes(a[2]) " de " a[1];
}

function reordena(data) {
    split(data,a,"-");
    return a[3] "-" a[2] "-" a[1]
}
