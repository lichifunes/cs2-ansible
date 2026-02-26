# Commandes CS2 Server — Référence complète

---

## Session screen

```bash
# Démarrer le serveur
screen -S cs2 -d -m ./start_cs2.sh

# Réattacher la console
screen -r cs2

# Détacher sans fermer (dans la console)
# Ctrl+A puis D

# Vérifier si le serveur tourne
screen -list

# Arrêter proprement (dans la console)
quit

# Arrêter depuis l'extérieur
screen -S cs2 -X stuff "quit$(printf '\r')"

# Tuer le processus (en dernier recours)
kill $(pgrep -f "cs2 -dedicated")
```

---

## Envoyer une commande sans entrer dans la console

```bash
# Syntaxe générale
screen -S cs2 -X stuff "MA_COMMANDE$(printf '\r')"

# Exemple : changer de map
screen -S cs2 -X stuff "map de_mirage$(printf '\r')"
```

---

## Maps

```bash
map de_dust2
map de_mirage
map de_inferno
map de_nuke
map de_ancient
map de_anubis
map de_vertigo
map de_overpass
map de_train
```

---

## Modes de jeu

```bash
# Compétitif (defuse 5v5)
game_type 0; game_mode 1

# Casual
game_type 0; game_mode 0

# Deathmatch
game_type 1; game_mode 2

# Wingman (2v2)
game_type 0; game_mode 2

# Arms Race
game_type 1; game_mode 0

# Demolition
game_type 1; game_mode 1

# Changer mode + map en une ligne
game_type 0; game_mode 1; map de_inferno
```

---

## Bots

```bash
bot_quota 0          # Supprimer tous les bots
bot_quota 5          # 5 bots répartis automatiquement
bot_add              # Ajouter 1 bot (équipe auto)
bot_add_t            # Ajouter 1 bot côté T
bot_add_ct           # Ajouter 1 bot côté CT
bot_kick             # Kick tous les bots
bot_difficulty 0     # Facile
bot_difficulty 1     # Normal
bot_difficulty 2     # Difficile
bot_difficulty 3     # Expert
```

---

## Joueurs & accès

```bash
status               # Liste des joueurs connectés (id, ping, ip, nom)
kick #2              # Kick le joueur avec l'id 2
banid 60 #2          # Ban 60 minutes le joueur id 2
removeid STEAMID     # Unban un joueur
listid               # Liste des bans actifs

sv_password ""           # Retirer le mot de passe
sv_password "Pomelo2025" # Remettre le mot de passe
```

---

## Round & match

```bash
mp_restartgame 1         # Redémarrer le match dans 1 seconde (score 0-0)
mp_warmup_start          # Lancer le warmup
mp_warmup_end            # Terminer le warmup
mp_endmatch              # Terminer le match en cours
mp_pause_match           # Mettre en pause (pause technique)
mp_unpause_match         # Reprendre la partie
mp_swapteams             # Inverser les équipes
mp_scrambleteams         # Mélanger les équipes aléatoirement

mp_maxrounds 24          # Nombre de rounds max
mp_overtime_enable 1     # Activer les overtime
mp_freezetime 15         # Durée du freeze time (secondes)
mp_roundtime_defuse 1.92 # Durée d'un round (minutes)
mp_roundtime_defuse 5    # Rounds de 5 min (plus relax)
mp_buytime 20            # Durée du buy time (secondes)
mp_buy_anywhere 1        # Acheter partout sur la map
```

---

## Argent

```bash
mp_startmoney 800        # Argent de départ standard
mp_startmoney 16000      # Argent max (pour tester)
mp_afterroundmoney 0     # Pas d'argent bonus entre rounds
```

---

## Triche / fun

```bash
sv_cheats 1              # Activer les cheats (pour tests)
sv_cheats 0              # Désactiver
god                      # Invincibilité (cheats requis)
noclip                   # Voler à travers les murs
give weapon_awp          # Donner une arme

# Mode fun : argent max
sv_cheats 1; mp_startmoney 16000
# Revenir en mode normal
sv_cheats 0; mp_startmoney 800
```

---

## Soirée LAN / Cyber — Aide-mémoire

```bash
# Avant la partie
mp_warmup_end            # Forcer la fin du warmup
mp_restartgame 1         # Lancer le match 0-0

# Pendant la partie
mp_pause_match           # Pause technique
mp_unpause_match         # Reprendre
mp_swapteams             # Inverser les équipes
mp_scrambleteams         # Mélanger aléatoirement
status                   # Voir les joueurs (ID, ping, steam)
kick #2                  # Kick le joueur ID 2

# Changer de mode + map rapidement
game_type 0; game_mode 1; map de_inferno    # Compétitif Inferno
game_type 1; game_mode 2; map de_dust2      # Deathmatch Dust2
game_type 0; game_mode 0; map de_mirage     # Casual Mirage

# Fin de soirée
mp_endmatch              # Terminer le match proprement
```

---

## Vérifier le serveur (depuis l'extérieur)

```bash
python3 check_cs2.py
```

---

## Mise à jour du serveur (SteamCMD)

```bash
# Arrêter le serveur d'abord, puis :
~/steamcmd/steamcmd.sh +login anonymous +app_update 730 +quit
```
