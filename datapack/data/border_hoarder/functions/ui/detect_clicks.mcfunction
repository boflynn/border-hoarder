# 1. Check if the 'Next Page' button (Slot 26) is missing
execute unless data block 0 -60 0 Items[{Slot:26b}] run function boarder_hoarder:ui/actions/next_page

# 2. Check if the 'Previous Page' button (Slot 21) is missing
execute unless data block 0 -60 0 Items[{Slot:21b}] run function boarder_hoarder:ui/actions/prev_page

# 3. Clean up: Remove the GUI items from the player's cursor/inventory
# so they don't actually 'steal' the buttons.
clear @a[distance=..10] minecraft:paper
clear @a[distance=..10] minecraft:gray_stained_glass_pane
