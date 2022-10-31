#!/usr/bin/env bash
#
function main(){
    change_html
    git_update
}

function get_projecao(){
    local _value=$(curl -X GET https://servicodados.ibge.gov.br/api/v1/projecoes/populacao/BR | jq '.projecao.populacao')
    echo $_value
}

function change_html(){
    readonly local _file=~/cison/html/done/index.html
    readonly local _value=$(get_projecao)
    readonly local _commad_sed=$(sed -i 's/[0-9]\{3,\}/'"$_value"'/g' $_file)
}

function git_update(){
    cd ~/cison/html/done/
    git add .
    git commit -m "altera index html com atualizacao de api"
    git push
    termux-toast -c green "Site atualizado: $(get_projecao)"
}

main
