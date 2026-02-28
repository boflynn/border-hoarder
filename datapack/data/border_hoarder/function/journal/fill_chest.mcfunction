# Reset offset counters to zero
scoreboard players set #temp_slot bh_loop_slot 0
scoreboard players set #temp_idx bh_loop_idx 0

# Set index offset based on the current page
execute store result score #temp_idx bh_loop_idx run scoreboard players get #global bh_page
scoreboard players set #page_size bh_loop_idx 23
scoreboard players operation #temp_idx bh_loop_idx *= #page_size bh_loop_idx

# Persist variables into params property
execute store result storage border_hoarder:temp params.slot int 1 run scoreboard players get #temp_slot bh_loop_slot
execute store result storage border_hoarder:temp params.actual_index int 1 run scoreboard players get #temp_idx bh_loop_idx

# Start the fill loop that will go through 23 items
function border_hoarder:journal/fill_loop with storage border_hoarder:temp params

# Add navigation buttons
item replace entity @e[tag=bh_anchor,limit=1] container.24 with minecraft:barrier[item_name={"text":"Refresh","color":"yellow","italic":false},custom_data={bh_action:reset,bh_display:1b}]
item replace entity @e[tag=bh_anchor,limit=1] container.25 with minecraft:crossbow[item_name={"text":"Previous Page","color":"green","italic":false},custom_data={bh_action:prev_page,bh_display:1b}]


# Get the current page and add 2 to get the "Next Page" number
# (e.g., if current page index is 0, next page is 2)
scoreboard players operation #temp_next_page bh_loop_idx = #global bh_page
scoreboard players add #temp_next_page bh_loop_idx 2
# 2. Get the total number of items in the workspace
execute store result score #total_items bh_loop_idx run data get storage border_hoarder:temp workspace

# Store this in storage so the macro can read it
execute store result storage border_hoarder:temp params.next_page_num int 1 run scoreboard players get #temp_next_page bh_loop_idx

# Call the button replacement as a macro
function border_hoarder:journal/set_next_page_button with storage border_hoarder:temp params

# Get the current page and add 2 to get the "Prev Page" number
# (e.g., if current page index is 0, prev page is 2)
scoreboard players operation #temp_prev_page bh_loop_idx = #global bh_page
scoreboard players add #temp_prev_page bh_loop_idx 0

# Store this in storage so the macro can read it
execute store result storage border_hoarder:temp params.prev_page_num int 1 run scoreboard players get #temp_prev_page bh_loop_idx

# Call the button replacement as a macro
function border_hoarder:journal/set_prev_page_button with storage border_hoarder:temp params
