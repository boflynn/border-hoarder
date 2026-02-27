# Reset game
# Called by player manually to completely reset the Border Hoarder game

# 1. Reset Storage (The "Memory")
# We delete the 'discovered' object and 'config' so 'setup' can re-initialize them
data remove storage border_hoarder:main discovered
data remove storage border_hoarder:main config
data remove storage border_hoarder:temp items

# Resets the counts for everyone on the server
scoreboard players reset * bh_discovered

# Resets to maximum size and centers it on the player
worldborder center ~ ~
worldborder set 50000000

# Reset all advancements to ensure the inventory scan trigger is ready to fire again
advancement revoke @a everything

# Clear the inventory of the person resetting to start fresh
clear @s

# Re-initialize all settings
function border_hoarder:setup

tellraw @a {"text":"[SYSTEM] Game has been fully reset. Use /function border_hoarder:start to begin!","color":"red","bold":true}
