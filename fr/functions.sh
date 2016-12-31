#!/bin/bash

saint () {
local lejour=$(LC_TIME="$language.UTF-8" date +"%d")
local lemois=$(LC_TIME="$language.UTF-8" date +"%m") 

if [[ "$lemois" == "01" ]]; then
local saint_config="$saint_config_jan"
local moisentier="Janvier"
fi

if [[ "$lemois" == "02" ]]; then
local saint_config="$saint_config_fev"
local moisentier="Février"
fi

if [[ "$lemois" == "03" ]]; then
local saint_config="$saint_config_mar"
local moisentier="Mars"
fi

if [[ "$lemois" == "04" ]]; then
local saint_config="$saint_config_avr"
local moisentier="Avril"

fi

if [[ "$lemois" == "05" ]]; then
local saint_config="$saint_config_mai"
local moisentier="Mai"

fi

if [[ "$lemois" == "06" ]]; then
local saint_config="$saint_config_jui"
local moisentier="Juin"

fi

if [[ "$lemois" == "07" ]]; then
local saint_config="$saint_config_juillet"
local moisentier="Juillet"

fi

if [[ "$lemois" == "08" ]]; then
local saint_config="$saint_config_aou"
local moisentier="Août"

fi

if [[ "$lemois" == "09" ]]; then
local saint_config="$saint_config_sep"
local moisentier="Septembre"

fi

if [[ "$lemois" == "10" ]]; then
local saint_config="$saint_config_oct"
local moisentier="Octobre"
fi

if [[ "$lemois" == "11" ]]; then
local saint_config="$saint_config_nov"
local moisentier="Novembre"

fi

if [[ "$lemois" == "12" ]]; then
local saint_config="$saint_config_dec"
local moisentier="Décembre"

fi

saint_conf
}



saint_conf () {
reponsesaint="on est le $lejour $moisentier"
while read device
do
local jour="$(jv_sanitize "$device" ".*")"
if [[ "$jour" == "$lejour" ]]; then
local nom="$(echo "$saint_config" | jq -r ".devices[] | select(.jour==\"$device\") | .nom")"
say "$reponsesaint C'est la Saint $nom"
fi
done <<< "$(echo "$saint_config" | jq -r '.devices[].jour')"
}




