# Start game
# Called by player when they find a suitable location to start the Border Hoarder game

scoreboard objectives add bh_discovered dummy "§6Items Discovered"
scoreboard objectives setdisplay sidebar bh_discovered
scoreboard objectives add bh_click_cooldown dummy
scoreboard objectives add bh_timer dummy
scoreboard players set #global bh_timer 0

# Place the pedestal at the center (where the player is standing)
setblock ~ ~ ~ minecraft:barrel{CustomName:'{"text":"Discovery Pedestal","color":"gold"}'}
summon marker ~ ~ ~ {Tags:["bh_pedestal"]}

# 1. Activate the Logic
# This tells the 'inventory_changed_trigger' function to start monitoring inventory changes
data modify storage border_hoarder:main config.is_active set value 1b

# 2. Reset Discovery Progress
# Ensures the game starts fresh even if the pack was reloaded.
data modify storage border_hoarder:main discovered set value {}
scoreboard players reset * bh_discovered

# 3. Setup the World Border
# Centers the border exactly where the player is standing.
execute at @s run worldborder center ~ ~
worldborder set 3

# 4. Visual & Audio Flair
# Makes the start feel impactful for everyone on the server.
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
title @a title {"text": "BORDER HOARDER", "bold": true, "color": "gold"}
title @a subtitle {"text": "The border is now 2x2. Good luck!", "color": "yellow"}

# 5. Global Announcement
tellraw @a ["",{"text":"[!] ","color":"red","bold":true},{"text":"Game started by ","color":"gray"},{"selector":"@s","color":"white","italic":true}]
tellraw @a {"text":"Every new item found will expand the world!","color":"green"}

# Place the pedestal at the center (where the player is standing)
setblock ~ ~-1 ~ minecraft:barrel{CustomName:'{"text":"Discovery Journal","color":"gold"}'}
# Tag it so we can find it later
summon marker ~ ~-1 ~ {Tags:["bh_pedestal"]}

scoreboard objectives add bh_total dummy "Total Found"
