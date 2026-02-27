# Increment page variable
execute as @s[scores={bh_click_cooldown=0}] run scoreboard players add #global bh_page 1

# Reset cooldown timer for paging
# TODO - With the various fixes to remove the paging items, is this needed?
scoreboard players set @s bh_click_cooldown 2

# Now that we're on the next page, refill the chest
function border_hoarder:journal/fill_chest
