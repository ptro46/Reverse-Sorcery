# Sorcery HD 0.2 — validation du 20 octobre 2026

- 41 textures 2560 × 1152 et atlas 3072 × 1152 : dimensions contrôlées ; 96 cases de sprites de 192 × 192.
- Empreintes SHA-256 des 42 images sources comparées au manifeste HD : identiques, images CPC conservées.
- Alpha de tous les fonds opaque ; test synthétique des bords translucides : pas de frange noire ajoutée par le filtre.
- Scale3x : préservation des aplats et symétrie par réflexion vérifiées.
- Six tests XCTest passés : quatre tests existants du moteur ; interpolation entre deux états et absence d’interpolation lors des téléportations / changements d’effectif.
- Trois tests Python du traitement HD passés.
- Construction release de l’application réussie ; lancement natif et menu HD observés à l’écran.
- Comparaison visuelle des décors et des sprites rétro / HD effectuée sur les textures réellement chargées par l’application.

La manette et la cadence réelle en plein écran n’ont pas été mesurées sur du matériel physique. L’automatisation des touches de la fenêtre HD a été interrompue par l’outil de contrôle de l’application ; le nouveau parcours complet par l’interface n’est donc pas considéré comme validé. Les tests du moteur et des poses d’affichage couvrent le comportement indépendant de cette interface.

Les limites du prototype 0.1 relatives à la fidélité du jeu et à la validation du parcours complet restent applicables. La modification HD porte sur la présentation et les entrées ; elle ne change pas les salles ou leurs collisions.
