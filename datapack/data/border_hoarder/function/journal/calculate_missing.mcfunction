# Executed when a player not looking at the minecart comes nearby

# Reset the missing items collection
data modify storage border_hoarder:temp current_missing set value []

# Populate the missing items
function border_hoarder:journal/populate_missing_items

# Copy the ilst of missing items from `current_missing` to `workspace`
# TODO - Why don't we just use the current_missing property?
data modify storage border_hoarder:temp workspace set from storage border_hoarder:temp current_missing
