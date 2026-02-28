# Calculate display number (bh_page 0 -> Page 2)
scoreboard players operation #num bh_loop_idx = #global bh_page
scoreboard players add #num bh_loop_idx 2
execute store result storage border_hoarder:temp params.next_page_num int 1 run scoreboard players get #num bh_loop_idx

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


$item replace entity @e[tag=bh_anchor,limit=1] container.26 with minecraft:arrow[item_name={"text":"Next Page (#$(next_page_num))","color":"green","italic":false},custom_data={bh_action:next_page,bh_display:1b}]
