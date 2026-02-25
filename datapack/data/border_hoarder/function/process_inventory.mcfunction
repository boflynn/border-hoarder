# Called from inventory_changed_trigger.mcfunction

# Copy the player's inventory to a temporary variable for processing
data remove storage border_hoarder:temp items
data modify storage border_hoarder:temp items set from entity @s Inventory

# Call the inventory loop to process the items one by one
function border_hoarder:loop_inventory
