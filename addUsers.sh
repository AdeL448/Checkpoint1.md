#!/bin/bash

if [ -z $@  ]; then
    echo "Merci de renseigner un nom d'utilisateur pour la création !"
    exit 1
fi

for utilisateur in "$@"; do
   
    if [ "$utilisateur" &>/dev/null ]; then
        echo "le nom d'utilisateur "$utlisateur" existe déjà"
        continue
    fi
       
      sudo useradd "$utilisateur"
   
    if [ $? -eq 0 ]; then
        echo "L'utilisateur $utilsateur a été créé avec succès !"
    else
        echo "La création de l'utilisateur $utilsateur a échoué..."
    fi
done
