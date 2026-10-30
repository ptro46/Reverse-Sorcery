# Validation de la version 0.1

Validé le 20 octobre 2026 sur le Mac Apple Silicon de travail.

- Extraction des trois fichiers AMSDOS : sommes d’en-tête valides, tailles 31550, 8695 et 534 octets ; SHA-256 conservés dans `Extracted/manifest.json`.
- Test différentiel par exécution des routines Z80 d’origine (outil de développement séparé) : 41 décompressions de salles, 944640 valeurs de pixels et 29520 cellules de collision identiques à l’export.
- Huit fichiers WAV présents, PCM mono 44100 Hz, non vides ; boucle musicale de 12,8 secondes et sept effets.
- Compilation Swift release réussie et application `.app` signée localement.
- Quatre tests XCTest réussis : validité des ressources et graphe des 40 salles ; vol et passage initial 0 → 1 avec coordonnées d’arrivée ; exploration et redémarrage ; 16000 pas de simulation sur les 40 salles sans sortie de bornes.
- Vérification de l’interface par lancement natif : écran d’accueil, déplacement au clavier, pause et carte des 40 salles affichés correctement.

Les tests automatiques ne prouvent pas qu’une partie complète est terminable. La fidélité des ennemis, des énigmes dans la réécriture et du mixage sonore reste à vérifier par comparaison avec une partie d’origine. Aucun test auditif comparatif ni parcours des huit sauvetages n’a été effectué.
