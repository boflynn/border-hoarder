say 'next page'

# Increment the page counter
scoreboard players add #global bh_page 1

# Recalculate which items to show based on the new page
function border_hoarder:journal/calculate_missing

# Refill the pedestal minecart with the new set of items
function border_hoarder:journal/fill_chest
