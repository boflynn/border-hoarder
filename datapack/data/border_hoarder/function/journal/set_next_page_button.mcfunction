# Calculate index of next page: (page index + 1) * (page size)
scoreboard players operation #next_page_start bh_loop_idx = #global bh_page
scoreboard players add #next_page_start bh_loop_idx 1
scoreboard players operation #next_page_start bh_loop_idx *= #page_size bh_loop_idx

# Get the total number of items in the workspace
execute store result score #total_items bh_loop_idx run data get storage border_hoarder:temp workspace

# Since pages are zero-based, display page number + 2 for next
scoreboard players operation #temp_next_page bh_loop_idx = #global bh_page
scoreboard players add #temp_next_page bh_loop_idx 2
execute store result storage border_hoarder:temp params.next_page_num int 1 run scoreboard players get #temp_next_page bh_loop_idx

# Only display if we're not at the end
$execute if score #next_page_start bh_loop_idx < #total_items bh_loop_idx run item replace entity @e[tag=bh_anchor,limit=1] container.26 with minecraft:arrow[item_name={"text":"Next Page (#$(next_page_num))","color":"green","italic":false},custom_data={bh_action:next_page,bh_display:1b}]
