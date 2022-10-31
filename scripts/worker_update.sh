#!/usr/bin/env bash
#
function main(){
    get_projecao
    git_update
}
function get_projecao(){
    readonly local _value=$(curl -X GET https://servicodados.ibge.gov.br/api/v1/projecoes/populacao/BR | jq '.projecao.populacao')
    echo $_value
}

function change_html(){
    local _file=~/cison/html/done/index.html
    local _value=$(get_projecao)
    local _command_sed=$(sed -i 's/[0-9]\{3,\}/'"$_value"'/g' $_file)
}

function git_update(){
    cd ~/cison/html/done
    git add .
    git commit -m "atualiza projecao"
    git push
}

main
