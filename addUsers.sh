#!/bin/bash

# Vérifier si des arguments sont fournis
if [ -z $@ ]; then
    echo "Merci de renseigner un nom pour la création d'utilisateur..."
    exit 1
fi

# Boucle pour chaque argument (nom d'utilisateur)
for utilisateur in "$@"; do

    # Vérifier si l'utilisateur existe déjà
    if [ -d $utilisateur ]; then
        echo "L'utilisateur $utilisateur existe déjà !"
        continue
    fi

    # Essai de création de l'utilisateur
    sudo useradd "$utilisateur"

    # Vérification de la réussite de la création
    if [ $? -eq 0 ]; then
        echo "L'utilisateur $utilisateur a été créé avec succès !"
    else
        echo "La création de l'utilisateur $utilisateur a échoué..."
    fi
done
