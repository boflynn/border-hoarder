# Increment the page number in storage
execute store result storage boarder_hoarder:temp current_page int 1 run data get storage boarder_hoarder:temp current_page
scoreboard players add #ui_page bh_logic 1

# Re-render the page with the new number
# (Using the render_page macro we designed earlier)
function boarder_hoarder:ui/render_page with storage boarder_hoarder:temp
