# Called from loop_inventory.mcfunction
# Receives an item from the temp storage list populated by the player's inventory
# Checks to see if the item has been discovered already
# If it has not, calls the expand function to add it to the list and expand the border

# If the item has not been discovered yet, call the expand function with the item id
$execute unless data storage border_hoarder:main discovered."$(id)" run function border_hoarder:expand {item_id:"$(id)"}
