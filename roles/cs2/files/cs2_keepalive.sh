#!/bin/bash
# Keep-alive pour rafraîchir le token GSLT
# - Si le serveur tourne déjà : on ne fait rien
# - Sinon : on le démarre 2 min puis on l'arrête

LOG=/home/cs2server/keepalive.log
echo "[$(date '+%F %T')] --- keepalive run ---" >> "$LOG"

if pgrep -f "cs2 -dedicated" > /dev/null; then
  echo "[$(date '+%F %T')] CS2 déjà en cours, rien à faire" >> "$LOG"
  exit 0
fi

echo "[$(date '+%F %T')] Démarrage du serveur CS2 pour keep-alive" >> "$LOG"
/usr/bin/screen -S cs2-keepalive -d -m /home/cs2server/start_cs2.sh

sleep 120

echo "[$(date '+%F %T')] Arrêt du serveur CS2" >> "$LOG"
/usr/bin/screen -S cs2-keepalive -X stuff "quit$(printf '\r')"
sleep 5

# Filet de sécurité si quit ne s'est pas propagé
if pgrep -f "cs2 -dedicated" > /dev/null; then
  pkill -f "cs2 -dedicated"
fi

echo "[$(date '+%F %T')] Keep-alive terminé" >> "$LOG"
