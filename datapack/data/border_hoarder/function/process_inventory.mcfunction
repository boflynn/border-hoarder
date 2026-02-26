# Called from inventory_changed_trigger.mcfunction
execute if predicate border_hoarder:has_ui_item run return 0

# Copy the player's inventory to a temporary variable for processing
data remove storage border_hoarder:temp items
data modify storage border_hoarder:temp items set from entity @s Inventory

# Call the inventory loop to process the items one by one
function border_hoarder:loop_inventory
