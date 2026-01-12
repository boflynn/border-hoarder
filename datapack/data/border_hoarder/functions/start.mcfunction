# ==========================================
# BOARDER HOARDER: START GAME
# ==========================================

# 1. Activate the Logic
# This tells the 'check_item' function it's allowed to start expanding the border.
data modify storage boarder_hoarder:main config.is_active set value 1b

# 2. Reset Discovery Progress
# Ensures the game starts fresh even if the pack was reloaded.
data modify storage boarder_hoarder:main discovered set value {}
scoreboard players reset * bh_discovered

# 3. Setup the World Border
# Centers the border exactly where the player is standing.
execute at @s run worldborder center ~ ~
worldborder set 1

# 4. Visual & Audio Flair
# Makes the start feel impactful for everyone on the server.
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
title @a title {"text": "BOARDER HOARDER", "bold": true, "color": "gold"}
title @a subtitle {"text": "The border is now 1x1. Good luck!", "color": "yellow"}

# 5. Global Announcement
tellraw @a ["",{"text":"[!] ","color":"red","bold":true},{"text":"Game started by ","color":"gray"},{"selector":"@s","color":"white","italic":true}]
tellraw @a {"text":"Every new item found will expand the world!","color":"green"}

# Place the pedestal at the center (where the player is standing)
setblock ~ ~-1 ~ minecraft:barrel{CustomName:'{"text":"Discovery Journal","color":"gold"}'}
# Tag it so we can find it later
summon marker ~ ~-1 ~ {Tags:["bh_pedestal"]}
