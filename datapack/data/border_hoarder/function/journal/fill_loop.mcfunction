# 1. Fill the current slot using the current state of params
function border_hoarder:journal/slot with storage border_hoarder:temp params

# 2. Increment scores for the next iteration
scoreboard players add #temp_slot bh_loop_slot 1
scoreboard players add #temp_idx bh_loop_idx 1

# 3. Update storage params for the NEXT iteration
execute store result storage border_hoarder:temp params.slot int 1 run scoreboard players get #temp_slot bh_loop_slot
execute store result storage border_hoarder:temp params.actual_index int 1 run scoreboard players get #temp_idx bh_loop_idx

# 4. Loop if we haven't hit the end of the page (slot 25)
execute if score #temp_slot bh_loop_slot matches ..24 run function border_hoarder:journal/fill_loop with storage border_hoarder:temp params
