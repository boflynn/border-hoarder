# Called initially from process_inventory.mcfunction
# Function to recursively loop through all items in the temp storage list

# Pass the first item in the list the check_item_discovered method
execute if data storage border_hoarder:temp items[0] run function border_hoarder:check_item_discovered with storage border_hoarder:temp items[0]

# Remove the processed item from the temp list
data remove storage border_hoarder:temp items[0]

# If there are items left, run this function again
execute if data storage border_hoarder:temp items[0] run function border_hoarder:loop_inventory
