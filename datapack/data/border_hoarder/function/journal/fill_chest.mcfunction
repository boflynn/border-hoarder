# Clear everything out in case all slots are not filled
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items set value []

# Reset offset counters to zero
scoreboard players set #temp_slot bh_loop_slot 0
scoreboard players set #temp_idx bh_loop_idx 0

# Set index offset based on the current page
execute store result score #temp_idx bh_loop_idx run scoreboard players get #global bh_page
scoreboard players set #page_size bh_loop_idx 24
scoreboard players operation #temp_idx bh_loop_idx *= #page_size bh_loop_idx

# Persist variables into params property
execute store result storage border_hoarder:temp params.slot int 1 run scoreboard players get #temp_slot bh_loop_slot
execute store result storage border_hoarder:temp params.actual_index int 1 run scoreboard players get #temp_idx bh_loop_idx

# Start the fill loop that will go through a page of items
function border_hoarder:journal/fill_loop with storage border_hoarder:temp params

# Add navigation buttons
item replace entity @e[tag=bh_anchor,limit=1] container.24 with minecraft:barrier[item_name={"text":"Reset","color":"yellow","italic":false},custom_data={bh_action:reset,bh_display:1b}]

# (e.g., if we are on page index 0, the next page starts at 24)
scoreboard players operation #next_page_start bh_loop_idx = #global bh_page
scoreboard players add #next_page_start bh_loop_idx 1
scoreboard players operation #next_page_start bh_loop_idx *= #page_size bh_loop_idx

# 2. Get the total number of items in the workspace
execute store result score #total_items bh_loop_idx run data get storage border_hoarder:temp workspace

#tellraw @a ["Current next_page_start: ", {"score":{"name":"#next_page_start","objective":"bh_loop_idx"}}]
#tellraw @a ["Current total_items: ", {"score":{"name":"#total_items","objective":"bh_loop_idx"}}]

scoreboard players operation #temp_next_page bh_loop_idx = #global bh_page
scoreboard players add #temp_next_page bh_loop_idx 2

# 3. Only show the "Next Page" button if the next page index is less than the total items
# Conditionally create the next page button
execute store result storage border_hoarder:temp params.next_page_num int 1 run scoreboard players get #temp_next_page bh_loop_idx
execute if score #next_page_start bh_loop_idx < #total_items bh_loop_idx run function border_hoarder:journal/set_next_page_button with storage border_hoarder:temp params

# Conditionally create the previous page button
function border_hoarder:journal/set_prev_page_button with storage border_hoarder:temp params
