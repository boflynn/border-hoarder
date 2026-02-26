# 1. Reset the UI slot to 0
scoreboard players set #temp_slot bh_loop_slot 0
scoreboard players set #temp_idx bh_loop_idx 0

# 2. Calculate the starting index for the page (Page * 25)
# This uses the same math we used to store the NBT start_index
execute store result score #temp_idx bh_loop_idx run scoreboard players get #global bh_page
scoreboard players set #const_25 bh_loop_idx 25
scoreboard players operation #temp_idx bh_loop_idx *= #const_25 bh_loop_idx

# 3. Now store these into the params storage for the 'with storage' call
execute store result storage border_hoarder:temp params.slot int 1 run scoreboard players get #temp_slot bh_loop_slot
execute store result storage border_hoarder:temp params.actual_index int 1 run scoreboard players get #temp_idx bh_loop_idx

# 4. Start the loop
function border_hoarder:journal/fill_loop with storage border_hoarder:temp params

# Navigation Buttons
item replace entity @e[tag=bh_anchor,limit=1] container.25 with minecraft:compass[item_name={"text":"Page 1","color":"yellow","italic":false},custom_data={bh_action:first_page,bh_display:1b}]
item replace entity @e[tag=bh_anchor,limit=1] container.26 with minecraft:arrow[item_name={"text":"Next Page","color":"green","italic":false},custom_data={bh_action:next_page,bh_display:1b}]
