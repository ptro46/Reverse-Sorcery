# Repères vérifiés dans cette image disque

Les adresses ci-dessous concernent cette version précise de Sorcery. Le lanceur BASIC contient un trainer en espagnol ; ses questions et POKE n’ont pas été exécutés. Le moteur natif n’active pas ces modifications.

| Donnée / routine | Adresse | Observation |
| --- | --- | --- |
| Entrée du chargeur | 05cf | LDDR : 7b3a octets de 27c6 vers 2fc5, décalage +07ff |
| Décompression d’une salle | 0e4e | Séparateurs ff ; 00,n = n tuiles vides |
| Affichage des tuiles | 0e7b | 720 tuiles, 40 colonnes × 18 lignes |
| Conversion en collisions | 0eb4 | Eau 81, décor solide 80, animation 01 / 02 |
| Sondes de collision | 1177–11ef | 12 × 24 pixels Mode 0 ; tests sur les nouvelles rangées / colonnes |
| Transport entre salles | 1332–1487 | Destination bits 0–5 = salle, bit 6 = deuxième porte, bit 7 = côté droit |
| Objets par salle | 5a40 | 40 × 8 octets, deux objets [y,x,image,état] |
| Ennemis et passages | 5b80 | 40 × 48 octets |
| Palette de jeu | 1cb2 | 16 couleurs matérielles, suivies de la bordure |
| Débuts des salles | 3242 | 40 salles et l’écran supplémentaire indexé 40 |
| Tuiles | 6500 | 256 × 16 octets : 4 × 8 pixels |
| Images de sprites | 7500 | pas de 144 octets : 12 × 24 pixels |
| Musique | 2411–24b1 | trois séquenceurs, [note,durée], table de périodes à 24b2 |
| Partitions | 2572 / 25f4 / 2736 | La commande ff réinitialise les trois séquenceurs |
| Effets sonores | 2315–2410 | Bruit canal A et tonalités canal B |

La salle d’indice 31 a une trame RLE de 719 cellules. Le code original ne définit pas la dernière cellule et conserve ce qui s’y trouve. L’export la met explicitement à zéro ; cela correspond à l’exécution avec le tampon initialement vide utilisée dans le test différentiel. Cette différence est isolée et documentée, sans lecture hors limites.

## Métadonnées d’une salle (48 octets)

- 0 : index de texte du lieu.
- 2–9 et 10–17 : ennemis ; état, y, x, image, compteur et état auxiliaire.
- 18, 22, 26 et 30 : portes [y,x,destination,condition]. y=ff désactive l’entrée.
- 34 : chaudron bénéfique [y,x,état].
- 37 : chaudron nuisible [y,x,dégâts].
- 40 : barrière [y,x,objet requis].
- 43 : deuxième barrière [y,x,objet requis].
- 46 : sorcier prisonnier [y,x] ; y=ff indique l’absence.

Les compteurs de l’original traitent une partie des nombres en BCD. Le moteur natif utilise des entiers décimaux ordinaires. La palette est convertie des indices matériels vers les 27 couleurs firmware, avec composantes 0,128,255.

## Limites connues de la réécriture

Le moteur n’est pas une traduction intégrale des instructions originales. Les automates d’ennemis, les compteurs d’énergie et de score, les animations de portes, la montée des sorciers libérés, les objets permutés selon le départ et les particularités du rendu XOR restent des points de fidélité à comparer à l’original. Les sprites exportés utilisent la transparence à la place du XOR. La géométrie des salles et les tables de données constituent la référence récupérée, indépendamment de ces adaptations.
