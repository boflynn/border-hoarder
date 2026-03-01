# Start game
# Manually ran by player when they find a suitable location to start the Border Hoarder game

# Create initial objectives and default values
scoreboard objectives add bh_discovered dummy "§6Items Discovered"
scoreboard objectives add bh_total dummy "Total Found"
scoreboard objectives setdisplay sidebar bh_discovered

scoreboard objectives add bh_page dummy
scoreboard objectives add bh_loop_idx dummy
scoreboard objectives add bh_loop_slot dummy

scoreboard players set #global bh_page 0

# Enable the game
# This tells the 'inventory_changed_trigger' function to start monitoring inventory changes
data modify storage border_hoarder:main config.is_active set value 1b

# Reset Discovery Progress
# Ensures the game starts fresh even if the pack was reloaded.
data modify storage border_hoarder:main discovered set value {}
scoreboard players reset * bh_discovered

# Setup the World Border
# Centers the border exactly where the player is standing.
execute at @s run worldborder center ~ ~
worldborder set 3

# Announce the start to everyone on the server.
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 0.8
title @a title {"text": "BORDER HOARDER", "bold": true, "color": "gold"}
title @a subtitle {"text": "The border is now 3x3. Good luck!", "color": "yellow"}
tellraw @a ["",{"text":"[!] ","color":"red","bold":true},{"text":"Game started by ","color":"gray"},{"selector":"@s","color":"white","italic":true}]
tellraw @a {"text":"Every new item found will expand the world!","color":"green"}

# Summon the collection log at the player's location
function border_hoarder:journal/spawn_pedestal
