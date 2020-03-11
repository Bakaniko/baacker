## code to prepare `DATASET` dataset goes here

# usethis::use_data("DATASET")
library(fs)
library(purrr)
library(here)
library(vroom)


## parameters
number_of_lines <- 10
# With 2018 datasets urls
vehicules_url <- "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167"
usagers_url <- "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a"
lieux_url <- "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9"
caracteristiques_url <- "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405"

url <- c(vehicules_url,usagers_url,lieux_url,caracteristiques_url)
name <- c("vehicules","usagers","lieux","caracteristiques")

# Create dataframe with urls and file names
df <- as.data.frame(cbind(name, url), stringsAsFactors = FALSE)

# Download and rename each file => problem with certain files
purrr::pmap(df, function(name,url) {
  print(paste0("Reading ",name,'.csv'))
  vroom::vroom(url, # reading the remote file
               delim=",",
               col_types = c(.default = "c")) %>% # convert all variables to characters
    head(n = number_of_lines) %>%
    # write file in data-raw folder
    vroom::vroom_write(here::here('data-raw',paste0(name,'.csv')),  delim = ",")
}  )


# Levels codes
## Rubrique CARACTERISTIQUES
# Lumière : conditions d’éclairage dans lesquelles l'accident s'est produit
baac_lum <- c(
"1" = "Plein jour",
"2" = "Crépuscule ou aube",
"3" = "Nuit sans éclairage public",
"4" = "Nuit avec éclairage public non allumé",
"5" = "Nuit avec éclairage public allumé"
)


# Localisation :
baac_agg <- c(
"1" = "Hors agglomération",
"2" = "En agglomération"
)
# Intersection :
baac_int <- c(
"1" = "Hors intersection",
"2" = "Intersection en X",
"3" = "Intersection en T",
"4" = "Intersection en Y",
"5" = "Intersection à plus de 4 branches",
"6" = "Giratoire",
"7" = "Place",
"8" = "Passage à niveau",
"9" = "Autre intersection"
)
#Conditions atmosphériques :
baac_atm <- c(
"1" = "Normale",
"2" = "Pluie légère",
"3" = "Pluie forte",
"4" = "Neige - grêle",
"5" = "Brouillard - fumée",
"6" = "Vent fort - tempête",
"7" = "Temps éblouissant",
"8" = "Temps couvert",
"9" = "Autre"
)

# Type de collision
baac_col <- c(
"1" = "Deux véhicules - frontale",
"2" = "Deux véhicules – par l’arrière",
"3" = "Deux véhicules – par le coté",
"4" = "Trois véhicules et plus – en chaîne",
"5" = "Trois véhicules et plus - collisions multiples",
"6" = "Autre collision",
"7" = "Sans collision"
)

#Codage GPS :1 caractère indicateur de provenance
baac_gps <- c(
"M" = "Métropole",
"A" = "Antilles (Martinique ou Guadeloupe)",
"G" = "Guyane",
"R" = "Réunion",
"Y" = "Mayotte"
)

## Rubrique LIEUX
# Catégorie de route
baac_catr <- c(
"1" = "Autoroute",
"2" = "Route Nationale",
"3" = "Route Départementale",
"4" = "Voie Communale",
"5" = "Hors réseau public",
"6" = "Parc de stationnement ouvert à la circulation publique",
"9" = "autre"
)

#Régime de circulation :
baac_circ <- c(
"1" = "A sens unique",
"2" = "Bidirectionnelle",
"3" = "A chaussées séparées",
"4" = "Avec voies d’affectation variable"
)

# Signale l’existence d’une voie réservée, indépendamment du fait que l’accident ait lieu ou non sur cette voie.
baac_vosp <- c(
"1" = "Piste cyclable",
"2" = "Banque cyclable",
"3" = "Voie réservée"
)

# Profil en long décrit la déclivité de la route à l'endroit de l'accident
baac_prof <- c(
"1" = "Plat",
"2" = "Pente",
"3" = "Sommet de côte",
"4" = "Bas de côte"
)

# Tracé en plan
baac_plan <- c(
"1" = "Partie rectiligne",
"2" = "En courbe à gauche",
"3" = "En courbe à droite",
"4" = "En « S »"
)

# Etat de la surface
baac_surf <- c(
"1" = "normale",
"2" = "mouillée",
"3" = "flaques",
"4" = "inondée",
"5" = "enneigée",
"6" = "boue",
"7" = "verglacée",
"8" = "corps gras - huile",
"9" = "autre"
)

# Aménagement - Infrastructure
baac_infra <- c(
"1" = "Souterrain - tunnel",
"2" = "Pont - autopont",
"3" = "Bretelle d’échangeur ou de raccordement",
"4" = "Voie ferrée",
"5" = "Carrefour aménagé",
"6" = "Zone piétonne",
"7" = "Zone de péage"
)

# Situation de l’accident
baac_situ <- c(
"1" = "Sur chaussée",
"2" = "Sur bande d’arrêt d’urgence",
"3" = "Sur accotement",
"4" = "Sur trottoir",
"5" = "Sur piste cyclable"
)

## rubrique VÉHICULES

# Sens de circulation                                                                        rattachés aux véhicules qui les ont heurtés) – Code alphanumérique
baac_senc <- c(
"1" = "PK ou PR ou numéro d’adresse postale croissant",
"2" = "PK ou PR ou numéro d’adresse postale décroissant"
)

# Catégorie du véhicule
baac_catv <- c(
"01" = "Bicyclette",
"02" = "Cyclomoteur < 50cm3",
"03" = "Voiturette (Quadricycle à moteur carrossé) (anciennement \"voiturette ou tricycle à moteur\")",
"04" = "Référence plus utilisée depuis 2006 (scooter immatriculé)",
"05" = "Référence plus utilisée depuis 2006 (motocyclette)",
"06" = "Référence plus utilisée depuis 2006 (side-car)",
"07" = "VL seul",
"08" = "Catégorie plus utilisée (VL + caravane)",
"09" = "Catégorie plus utilisée (VL + remorque)",
"10" = "VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque (anciennement VU seul 1,5T <= PTAC <= 3,5T)",
"11" = "Référence plus utilisée depuis 2006 (VU (10) + caravane)",
"12" = "Référence plus utilisée depuis 2006 (VU (10) + remorque)",
"13" = "PL seul 3,5T <PTCA <= 7,5T",
"14" = "PL seul > 7,5T",
"15" = "PL > 3,5T + remorque",
"16" = "Tracteur routier seul",
"17" = "Tracteur routier + semi-remorque",
"18" = "Référence plus utilisée depuis 2006 (transport en commun)",
"19" = "Référence plus utilisée depuis 2006 (tramway)",
"20" = "Engin spécial",
"21" = "Tracteur agricole",
"30" = "Scooter < 50 cm3",
"31" = "Motocyclette > 50 cm3 et <= 125 cm3",
"32" = "Scooter > 50 cm3 et <= 125 cm3",
"33" = "Motocyclette > 125 cm3",
"34" = "Scooter > 125 cm3",
"35" = "Quad léger <= 50 cm3 (Quadricycle à moteur non carrossé)",
"36" = "Quad lourd > 50 cm3 (Quadricycle à moteur non carrossé)",
"37" = "Autobus",
"38" = "Autocar",
"39" = "Train",
"40" = "Tramway",
"99" = "Autre véhicule (dont piéton en roller ou en trottinette à partir de l’année 2018 requalifié en \"engin de
déplacement personnel\")"
)

# Obstacle fixe heurté
baac_obs <- c(
"1"= "Véhicule en stationnement",
"2"= "Arbre",
"3"= "Glissière métallique",
"4"= "Glissière béton",
"5"= "Autre glissière",
"6"= "Bâtiment, mur, pile de pont",
"7"= "Support de signalisation verticale ou poste d’appel d’urgence",
"8"= "Poteau",
"9"= "Mobilier urbain",
"10" = "Parapet",
"11" = "Ilot, refuge, borne haute",
"12" = "Bordure de trottoir",
"13" = "Fossé, talus, paroi rocheuse",
"14" = "Autre obstacle fixe sur chaussée",
"15" = "Autre obstacle fixe sur trottoir ou accotement",
"16" = "Sortie de chaussée sans obstacle",
)

# Obstacle mobile heurté
baac_obsm <- c(
"1" = "Piéton",
"2" = "Véhicule",
"4" = "Véhicule sur rail",
"5" = "Animal domestique",
"6" = "Animal sauvage",
"9" = "Autre"
)

# Point de choc initial
baac_choc <- c(
"1" = "Avant",
"2" = "Avant droit",
"3" = "Avant gauche",
"4" = "Arrière",
"5" = "Arrière droit",
"6" = "Arrière gauche",
"7" = "Côté droit",
"8" = "Côté gauche",
"9" = "Chocs multiples (tonneaux)"
)

# Manoeuvre principale avant l’accident
baac_manv <- c(
"1" = "Sans changement de direction",
"2" = "Même sens, même file",
"3" = "Entre 2 files",
"4" = "En marche arrière",
"5" = "A contresens",
"6" = "En franchissant le terre-plein central",
"7" = "Dans le couloir bus, dans le même sens",
"8" = "Dans le couloir bus, dans le sens inverse",
"9" = "En s’insérant",
"10" = "En faisant demi-tour sur la chaussée",
#Changeant de file
"11" = "Changeant de file à gauche",
"12" = "Changeant de file à droite",
#Déporté
"13" = "Déporté A gauche",
"14" = "Déporté A droite",
# Tournant
"15" = "Tournant A gauche",
"16" = "Tournant A droite",
# Dépassant
"17" = "Dépassant A gauche",
"18" = "Dépassant A droite",
# Divers
"19" = "Traversant la chaussée",
"20" = "Manoeuvre de stationnement",
"21" = "Manoeuvre d’évitement",
"22" = "Ouverture de porte",
"23" = "Arrêté (hors stationnement)",
"24" = "En stationnement (avec occupants)"
)

# Catégorie d'usager
baac_catu <- c(
"1" = "Conducteur",
"2" = "Passager",
"3" = "Piéton",
"4" = "Piéton en roller ou en trottinette" #(catégorie déplacée, à partir de l’année 2018, vers le fichier"Véhicules" Catégorie du véhicule : 99 = " Autre véhicule. Cette catégorie est désormais considérée comme un véhicule : engin de déplacement personnel)
)
#Gravité de l'accident : Les usagers accidentés sont classés en trois catégories de victimes plus les indemnes
baac_grav <- c(
"1" = "Indemne",
"2" = "Tué",
"3" = "Blessé hospitalisé",
"4" = "Blessé léger"
)

# Sexe de l'usager
baac_sexe <- c(
"1" = "Masculin",
"2" = "Féminin"
)

# Motif du déplacement au moment de l’accident
baac_trajet <- c(
"1" = "Domicile - travail",
"2" = "Domicile - école",
"3" = "Courses - achats",
"4" = "Utilisation professionnelle",
"5" = "Promenade - loisirs",
"9" = "Autre",
)

# Sécurité sur 2 caractères :
# le premier concerne l’existence d’un Équipement de sécurité
baac_secu1 <- c(
"1" = " Ceinture",
"2" = " Casque",
"3" = " Dispositif enfants",
"4" = " Equipement réfléchissant",
"9" = " Autre"
)
# le second concerne l’utilisation de l’Équipement de sécurité
baac_secu2 <- c(
"1" = " Oui",
"2" = " Non",
"3" = " Non déterminable"
)

# Localisation du piéton
baac_locp  <- c(
# Sur chaussée :
"1" = "À + 50 m du passage piéton",
"2" = "À - 50 m du passage piéton",
# Sur passage piéton :
"3" = "Sans signalisation lumineuse",
"4" = "Avec signalisation lumineuse",
# Divers :
"5" = "Sur trottoir",
"6" = "Sur accotement",
"7" = "Sur refuge ou BAU",
"8" = "Sur contre allée"
)

# Action du piéton
baac_actp <- c(
#   Se déplaçant
"0" = "non renseigné ou sans objet",
"1" = "Sens véhicule heurtant",
"2" = "Sens inverse du véhicule",
#Divers
"3" = "Traversant",
"4" = "Masqué",
"5" = "Jouant - courant",
"6" = "Avec animal",
"9" = "Autre"
)

# variable permet de préciser si le piéton accidenté était seul ou non
baac_etatp  <- c(
"1" = "Seul",
"2" = "Accompagné",
"3" = "En groupe"
)

# Stockage dans un dataframe

names <- ls(pattern = "baac_")

baac_codage <- data.frame(names = names %>% stringr::str_replace("baac_", "") ,
                     definitions = I(purrr::map(names, get)))
usethis::use_data(baac_codage)
