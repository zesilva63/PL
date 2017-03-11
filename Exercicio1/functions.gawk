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
    return a[3] " de " get_mes(a[2]) a[1];
}

function reordena(data) {
    split(data,a,"-");
    return a[3] "-" a[2] "-" a[1]
}
