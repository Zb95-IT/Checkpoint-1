#!/bin/bash
 
# ÉTAPE 1 : Vérifier qu'il y a des arguments 
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument Fin du script"
    exit 1
fi
 # ÉTAPE 2 : Boucler sur chaque argument 
for user in "$@"; do
  # ÉTAPE 3 : Vérifier si l'utilisateur existe déjà 
     if id "$user" > /dev/null 2>&1; then
        echo "L'utilisateur $user existe déjà"
 else
        # ÉTAPE 4 : Créer l'utilisateur 
        if useradd -m -s /bin/bash "$user"; then
            echo "L'utilisateur $user a été crée"
        else
            echo "Erreur à la création de l'utilisateur $user"
        fi
 
    fi
 done
