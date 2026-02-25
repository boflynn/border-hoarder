# Reset game
# Called by player manually to completely reset the Border Hoarder game

# 1. Reset Storage (The "Memory")
# We delete the 'discovered' object and 'config' so 'setup' can re-initialize them
data remove storage border_hoarder:main discovered
data remove storage border_hoarder:main config
data remove storage border_hoarder:temp items

# 2. Reset Scoreboards
# Resets the counts for everyone on the server
scoreboard players reset * bh_discovered

# 3. Reset World Border
# Resets to 1x1 block (size 1) and centers it on the player
worldborder center ~ ~
worldborder set 50000000

# 4. Reset Advancements
# This ensures the inventory scan trigger is ready to fire again
advancement revoke @a everything

# 5. Clean up the area
# Optional: Clear the inventory of the person resetting to start fresh
clear @s

# 6. Re-run Setup
# This recreates the empty storage objects and sets is_active to 0b
function border_hoarder:setup

tellraw @a {"text":"[SYSTEM] Game has been fully reset. Use /function border_hoarder:start to begin!","color":"red","bold":true}
