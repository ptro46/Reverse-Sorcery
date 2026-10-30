# Correctif 0.2.1 : recharge sur les chaudrons

Le 20 octobre 2026, la régression signalée a été reproduite avec des pas de simulation ordinaires, en laissant d’abord diminuer l’énergie puis en faisant tomber le sorcier sur un chaudron.

Cause : `Game.tileFlag` utilisait le masque `00 ff 00 / 00 ff 00 / 00 00 00` pour les chaudrons, au lieu du masque original à l’adresse 1d33 : `00 00 00 / ff ff ff / ff ff ff`. Le sorcier de 24 pixels se posait à `chaudronY - 24`. La routine d’énergie originale à 14a1 attend `chaudronY - 16` (soustraction de 10 hexadécimal à 14ac), avec une tolérance horizontale de quatre pixels. La recharge du moteur natif utilisait déjà cette hauteur et ne pouvait donc pas se déclencher à l’arrêt.

Correction : les chaudrons bénéfiques et nuisibles utilisent maintenant le masque original. Le reste des masques et les paramètres de recharge n’ont pas été modifiés.

Validation :

- Avant correction : les quatre tests de chaudron échouent, dont les neuf positions bénéfiques récupérées sur le disque ; le point d’arrêt est systématiquement huit pixels trop haut.
- Après correction : les dix tests XCTest passent, dont quatre tests de régression couvrant l’atterrissage et la recharge jusqu’à 99, les neuf positions originales, l’absence de recharge décentrée, le chaudron absent et le chaudron nuisible.
- Les tests de chaudrons isolent les collisions et l’énergie des ennemis et du décor. Ils conservent les dimensions du sorcier, les commandes ordinaires, le pas de temps et la perte d’énergie du moteur. Aucun téléporteur de test ou accès forcé aux variables privées n’est ajouté à l’application.
- La construction release porte le numéro 0.2.1 et est livrée séparément de l’application 0.2.0 pour éviter de remplacer un exécutable éventuellement encore ouvert.
