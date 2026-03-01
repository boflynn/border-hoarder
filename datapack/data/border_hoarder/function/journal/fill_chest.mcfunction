# Clear everything out in case all slots are not filled
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items set value []

# Reset offset counters to zero
scoreboard players set #temp_slot bh_loop_slot 0
scoreboard players set #temp_idx bh_loop_idx 0

# Set index offset based on the current page
execute store result score #temp_idx bh_loop_idx run scoreboard players get #global bh_page
scoreboard players set #page_size bh_loop_idx 24
scoreboard players operation #temp_idx bh_loop_idx *= #page_size bh_loop_idx

# Start the fill loop that will go through a page of items
function border_hoarder:journal/fill_loop with storage border_hoarder:temp params

# Add reset button
item replace entity @e[tag=bh_anchor,limit=1] container.24 with minecraft:barrier[item_name={"text":"Reset","color":"yellow","italic":false},custom_data={bh_action:reset,bh_display:1b}]

# Conditionally create the next and previous page buttons
function border_hoarder:journal/set_next_page_button with storage border_hoarder:temp params
function border_hoarder:journal/set_prev_page_button with storage border_hoarder:temp params
