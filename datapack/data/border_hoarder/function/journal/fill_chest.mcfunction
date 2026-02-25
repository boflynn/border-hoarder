# Clear the current chest minecart items
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items set value []

# Calculate the start index once: bh_page * 25
execute store result storage border_hoarder:temp params.start_index int 25 run scoreboard players get #global bh_page

# To fill slot 0 (Index = Start + 0)
data modify storage border_hoarder:temp params.actual_index set from storage border_hoarder:temp params.start_index
data modify storage border_hoarder:temp params.slot set value 0b
function border_hoarder:journal/slot with storage border_hoarder:temp params

# To fill slot 1 (Index = Start + 1)
execute store result storage border_hoarder:temp params.actual_index int 1 run scoreboard players add #temp dummy 1
data modify storage border_hoarder:temp params.slot set value 1b
function border_hoarder:journal/slot with storage border_hoarder:temp params

# ... repeat for other slots


# Add the Navigation Arrow in slot 26
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append value {Slot:26b, id: "minecraft:arrow", count: 1, components: {"minecraft:custom_data": {bh_action: "next_page", bh_display: 1b}, "minecraft:item_name": '{"text":"Next Page"}'}}
