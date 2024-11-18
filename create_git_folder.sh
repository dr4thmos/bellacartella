#!/bin/bash

# Controllo del numero di parametri
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <nome-repo>"
    exit 1
fi

# Parametro: Nome della repository
REPO_NAME=$1

# 1. Creazione della cartella e inizializzazione di Git
echo "Creazione della cartella $REPO_NAME..."
mkdir $REPO_NAME
cd $REPO_NAME || exit

echo "Inizializzazione del repository Git..."
git init

# 2. Creazione del README.md
echo "Scrittura del README.md..."
echo "# $REPO_NAME" > README.md


# 3. Aggiunta dei file e primo commit
echo "Primo commit"
git add .
git commit -m "Inizializzazione del repository"

# 4. Creazione del repository remoto su GitHub
echo "Creazione del repository su GitHub..."
gh repo create $REPO_NAME --private --description "Repository per il progetto $REPO_NAME" --confirm
git remote add origin https://github.com/dr4thmos/$REPO_NAME.git

# 5. Collegamento del repository remoto e primo push
echo "Collegamento al repository remoto..."
git branch -M main
git push -u origin main

# Conferma finale
echo "Repository $REPO_NAME creato e pubblicato su GitHub con successo!"