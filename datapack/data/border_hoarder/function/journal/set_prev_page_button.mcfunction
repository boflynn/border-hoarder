# You can only compare scores to scores; this is silly
scoreboard players set #one bh_loop_idx 1

# Copy the global page into a variable; increment by one since people aren't zero-based
scoreboard players operation #temp_prev_page bh_loop_idx = #global bh_page
scoreboard players add #temp_prev_page bh_loop_idx 1

# Persist the current value in params
execute store result storage border_hoarder:temp params.prev_page_num int 1 run scoreboard players get #temp_prev_page bh_loop_idx

# Only display from pages one forward
$execute if score #temp_prev_page bh_loop_idx > #one bh_loop_idx run item replace entity @e[tag=bh_anchor,limit=1] container.25 with minecraft:crossbow[item_name={"text":"Previous Page (#$(prev_page_num))","color":"green","italic":false},custom_data={bh_action:prev_page,bh_display:1b}]
