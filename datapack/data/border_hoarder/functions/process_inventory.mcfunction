# Loop through the player's inventory and check items
# For simplicity, we'll check the item in the player's main hand.
# A more advanced version can loop through the whole Inventory array.
execute as @s property Inventory[0] run function boarder_hoarder:apply_discovery with entity @s Inventory[-1]
