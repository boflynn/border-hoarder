# Decrement the page number (but don't go below 0)
execute if score #ui_page bh_logic matches 1.. run scoreboard players remove #ui_page bh_logic 1

# Re-render
function boarder_hoarder:ui/render_page with storage boarder_hoarder:temp
