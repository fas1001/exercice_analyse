# Analyse factorielle et régressions

Ce projet guide vous permettra d'explorer l'analyse factorielle exploratoire et son application dans un contexte de recherche quantitative. Vous apprendrez à nettoyer des données, créer une échelle composite à partir d'une analyse factorielle, et utiliser cette échelle dans des analyses de régression.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

1. R (version 4.0.0 ou supérieure)
2. RStudio (dernière version recommandée)
3. Les packages R nécessaires

Pour installer les packages requis, exécutez les commandes suivantes dans R :

```r
# Installation des packages CRAN
install.packages(c("dplyr", "tidyr", "ggplot2", "modelsummary", "devtools"))

# Installation du package sondr depuis GitHub
devtools::install_github("ellipse-science/sondr")
```

## Structure du projet

Le projet est organisé comme suit :

```
exercice_analyse
├── data
│   ├── clean
│   │   ├── 0_data_fa.rds
│   │   └── 1_data_scale.rds
│   └── raw
│       └── data_raw.rds
├── docs
│   └── report
│       ├── img
│       │   └── UdeM_CoA.png
│       ├── projet.pdf
│       ├── projet.qmd
│       └── references.bib
├── R
│   ├── 0_fa_cleaning.R
│   ├── 1_factor_analysis.R
│   ├── 2_create_scale.R
│   └── 3_analysis.R
├── README.md
└── results
    ├── figures
    │   └── redneck_scale.png
    └── tables
        └── reg_table.md
```

## Workflow

Le projet se déroule en quatre étapes principales, chacune correspondant à un script R :

### 1. Nettoyage des données (`0_fa_cleaning.R`)
- Standardisation des variables sur une échelle de 0 à 1
- Recodage des variables catégorielles
- Gestion des valeurs manquantes
- Sauvegarde des données nettoyées

### 2. Analyse factorielle (`1_factor_analysis.R`)
- Exploration de la structure des données
- Réalisation d'une analyse factorielle exploratoire
- Visualisation des résultats
- Identification des facteurs pertinents

### 3. Création d'échelle (`2_create_scale.R`)
- Construction d'une échelle composite basée sur les résultats de l'analyse factorielle
- Vérification de la distribution de l'échelle
- Sauvegarde des données avec la nouvelle échelle

### 4. Analyses statistiques (`3_analysis.R`)
- Création de plusieurs modèles de régression
- Comparaison des modèles
- Génération d'un tableau de résultats

## Pour commencer

1. Clonez ce répertoire :
```bash
git clone https://github.com/fas1001/exercice_factor_analysis.git
```

2. Dans RStudio, ouvrez le projet en cliquant sur le fichier `.Rproj`

3. Créez les sous-dossiers nécessaires dans le dossier `data/` :
```bash
mkdir -p data/raw data/clean
```

4. Placez vos données brutes dans le dossier `data/raw/`

5. Exécutez les scripts dans l'ordre (0 à 3)

## Rapport

Un template de rapport Quarto est fourni dans le dossier `docs/report/`. Pour le compiler :

1. Ouvrez le fichier `docs/report/projet.qmd` dans RStudio
2. Cliquez sur le bouton "Render"

## Support

Si vous rencontrez des difficultés :
- Consultez les commentaires dans les scripts R
- Posez vos questions sur le canal Slack du cours
- Venez aux heures de consultation

## Note sur les données

Les données utilisées dans cet exercice ne sont pas incluses dans le répertoire GitHub. Vous les recevrez séparément via Studium.
