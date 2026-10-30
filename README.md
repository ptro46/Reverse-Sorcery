# Sorcery HD — reconstruction native Mac, v0.2.1

Première version jouable en Swift / AppKit, issue du disque fourni. Elle fonctionne en natif sur Apple Silicon, sous macOS 13 ou supérieur. L’application ne contient aucun émulateur Z80, aucune ROM CPC et n’a besoin ni de Recalbox ni du DSK au lancement.

Le projet est installé dans `/Users/ptro/Projets/Sorcery`. L’application se trouve dans `build/Sorcery HD.app`.

## Correctif 0.2.1 — chaudrons

Le masque de collision des chaudrons a été corrigé d’après les octets du jeu original à l’adresse 1d33. Le sorcier s’arrêtait huit pixels trop haut et ne touchait jamais la zone qui recharge son énergie. Il se pose maintenant à la bonne hauteur : se centrer sur un chaudron bénéfique et relâcher les commandes permet de remonter jusqu’à 99. Aucun appui sur Espace n’est nécessaire.

Les tests reproduisent la régression avant correction et vérifient ensuite la recharge aux neuf positions de chaudrons du disque, le plafond à 99 et l’absence de recharge lorsqu’on reste décentré. Les chaudrons nuisibles, s’ils sont présents, conservent leur effet négatif.

Quitter l’ancienne application avant d’ouvrir la version 0.2.1. La nouvelle fenêtre porte le numéro de version pour faciliter la vérification.

## Version HD

Cette version ajoute des textures agrandies avec traitement des contours : 41 décors en 2560 × 1152 pixels et 96 images de sprites en 192 × 192 pixels. Deux passes Scale3x sont suivies d’un redimensionnement Lanczos en alpha prémultiplié, pour éviter les franges noires autour des personnages. Le pixel Amstrad conserve ses proportions 2:1. Il s’agit d’un agrandissement algorithmique cohérent entre les animations, sans ajout de nouveaux détails dessinés.

Le moteur conserve ses pas de simulation à 37,5 Hz et interpole les positions affichées avec une boucle de présentation à 60 Hz. Les changements de salle ne sont pas interpolés. La cadence effective dépend de la charge du Mac. L’interface utilise des textes plus grands et lissés, des cartes d’état lisibles et un canevas qui s’adapte à la fenêtre et au plein écran.

- **H** : comparer le rendu HD et le rendu rétro, y compris depuis la carte.
- **F** : plein écran ; le menu Affichage propose aussi **Ctrl + Cmd + F**.
- **WASD / ZQSD** : déplacement au clavier, en plus des flèches. **E** fait la même action qu’Espace. **P** met en pause.
- Des boutons permettent de lancer / reprendre la partie et de changer le rendu à la souris.
- Manette reconnue par macOS : stick ou croix pour diriger, haut ou **A** pour voler, **B** pour agir, **X** pour la carte, **Menu** pour la pause. Dans la carte : stick / croix puis **A** pour confirmer.

La prise en charge des manettes utilise GameController et inclut la connexion après lancement. Elle est compilée mais n’a pas été testée sur une manette physique dans cette session.

Référence de l’algorithme : [spécification Scale3x](https://www.scale2x.it/algorithm). L’implémentation Python du projet est indépendante. Référence du support manette : [Apple GameController](https://developer.apple.com/documentation/gamecontroller).

## Jouer

Double-cliquer sur **Sorcery HD.app**, puis appuyer sur **Entrée**.

- **Flèche haut** : voler ; relâcher pour descendre.
- **Flèches gauche / droite** : diriger le sorcier.
- **Espace** : prendre / échanger un objet, utiliser une arme ou un sort.
- **Échap / P** : pause ; **Entrée** : reprendre.
- **R** : recommencer une partie normale.
- **M** : couper / rétablir le son.
- **Tab** : carte des 40 salles. Flèches et Entrée pour choisir une salle ; ce choix active le mode exploration, sans dégâts.
- **F2** : basculer le mode exploration ; dans ce mode, **[ / ]** parcourent les salles.

Les lettres sont interprétées selon la disposition du clavier. W/Z monte ; A/Q va à gauche ; D va à droite.

Chercher les objets, ouvrir les passages et libérer les huit sorciers. Certains passages demandent les armoiries ou la fleur de lys. Les barrières utilisent l’objet indiqué dans les données du jeu. Les chaudrons permettent de regagner de l’énergie ; attention aux ennemis, à l’eau et au feu. Après les huit sauvetages, rejoindre le sanctuaire (salle 29 dans la carte).

## Ce qui est réalisé

- Lecture du DSK et extraction des trois fichiers, avec validation des en-têtes AMSDOS et empreintes SHA-256.
- Reconstitution de la mémoire après le déplacement de chargement à +0x7ff.
- Export de 256 tuiles, 96 images de sprites, 40 décors de jeu et d’un écran supplémentaire.
- Palette d’origine, noms des lieux et des objets ; tables d’objets, ennemis et passages récupérées.
- Moteur Swift à pas fixe de 37,5 Hz : vol, gravité, collisions, connexions entre les salles, objets transportés, portes, barrières, armes, projectiles, énergie, sauvetages et condition de victoire.
- Musique de titre et sept effets reconstruits à partir des séquences sonores du jeu, exportés en WAV et joués par AVFoundation.
- Carte, exploration sans dégâts, pause, redémarrage et mise en pause à la perte de focus.

## État et fidélité

Cette version est un **prototype jouable**, pas encore une reproduction intégralement validée du comportement de 1985.

Les décors et les cases de collision exportés sont vérifiés contre l’exécution des routines Z80 originales. Les adresses et connexions de portes sont issues du disque. Les sondes de collision du moteur ont été traduites des routines originales.

Les comportements et animations des ennemis sont encore simplifiés, ainsi que les dégâts, le score et les transitions animées. Le départ reste fixé à un des points d’apparition originaux ; la sélection aléatoire des points de départ et les permutations d’objets de l’original restent à reproduire. Les sons utilisent une synthèse numérique de la puce AY : il ne s’agit pas d’un enregistrement analogique ni d’une émulation sonore au cycle près. Les dernières images de la banque brute sont conservées sans toutes les considérer comme des animations utiles.

Le parcours complet des huit sauvetages jusqu’à la victoire n’a pas encore été validé en partie. La condition de victoire est implémentée, mais ce prototype ne constitue pas une preuve que toutes les énigmes sont terminables avec ces adaptations. Les paramètres et le moteur restent entièrement éditables pour poursuivre cette vérification.

## Compiler et vérifier

Avec les outils de développement Apple installés :

```sh
./build-app.sh
```

Pour les tests du moteur :

```sh
CLANG_MODULE_CACHE_PATH="$PWD/build/ModuleCache" \
SWIFTPM_MODULECACHE_OVERRIDE="$PWD/build/ModuleCache" \
swift test --disable-sandbox --scratch-path build/swift
```

Les PNG, WAV et JSON sont déjà livrés. Python sert uniquement à refaire les extractions et les vérifications de rétro-ingénierie :

```sh
python3 -m venv .venv
.venv/bin/pip install -r Tools/requirements.txt
.venv/bin/python Tools/extract_dsk.py "/Volumes/SSD-1/Recalbox/Amstrad/sorcery-amtrad-cpc-1985.dsk" Extracted
.venv/bin/python Tools/extract_assets.py
.venv/bin/python Tools/extract_audio.py
.venv/bin/python Tools/upscale_assets.py
.venv/bin/python Tools/test_hd.py
.venv/bin/python Tools/validate_assets.py
```

## Organisation

- `Sources/SorceryCore/Game.swift` : logique native et état de partie.
- `Sources/SorceryMac/main.swift` : fenêtre et menus Mac.
- `Sources/SorceryMac/GameView.swift` : rendu HD / rétro, interface, clavier et manette.
- `Sources/SorceryMac/Audio.swift` : lecture audio.
- `Sources/SorceryCore/Presentation.swift` : interpolation d’affichage indépendante de la simulation.
- `Sources/SorceryMac/Resources` : ressources directement consommées par l’application.
- `Tools/` : outils d’extraction, d’analyse et de vérification.
- `Extracted/` : binaires extraits, mémoire de référence et planches de contact.
- `Notes/` : observations de rétro-ingénierie et résultats de validation.

Références techniques : [guide firmware Amstrad](https://www.cpcwiki.eu/imgs/0/02/CPC_firmware.pdf), [format graphique Mode 0](https://cpctech.cpcwiki.de/docs/graphics.html). La validation des routines originales utilise [kosarev/z80](https://github.com/kosarev/z80), outil de développement sous licence MIT installé séparément ; il n’est pas lié à l’application.

Les ressources originales restent la propriété de leurs auteurs respectifs. Ce dépôt est une reconstruction locale à partir du disque fourni ; aucune publication n’a été effectuée.
