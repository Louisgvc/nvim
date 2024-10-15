#!/bin/bash

# Fonction pour rétablir les paramètres DPMS et supprimer la capture d'écran
revert() {
  rm ~/temp/screenshot.png
  xset dpms 0 0 0
}

# Capturer les signaux pour appeler la fonction revert
trap revert HUP INT TERM

# Définir les paramètres DPMS (Energy Star)
xset +dpms dpms 0 0 5

# Créer le répertoire temp s'il n'existe pas
mkdir -p ~/temp

# Prendre une capture d'écran et l'enregistrer
maim ~/temp/screenshot.png

# Flouter la capture d'écran
magick convert ~/temp/screenshot.png -blur 0x8 ~/temp/screen_blur.png

# Réduire puis agrandir la capture d'écran
magick mogrify -scale 10% -scale 1000% ~/temp/screenshot.png

# Composer la capture d'écran avec une autre image
magick convert -composite ~/temp/screenshot.png ~/.config/i3/hp4.png -gravity South -geometry -10x1200 ~/temp/screen.png

# Verrouiller l'écran avec la nouvelle image
i3lock -i ~/temp/screen.png

# Rétablir les paramètres après le déverrouillage
revert

