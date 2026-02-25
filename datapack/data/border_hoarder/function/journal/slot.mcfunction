# 1. Calculate the actual index in the workspace
$execute store result storage border_hoarder:temp actual_index int 1 run scoreboard players get #global bh_page
execute store result storage border_hoarder:temp actual_index int 25 run storage border_hoarder:temp actual_index
# Add the local slot index to the page offset
$execute store result storage border_hoarder:temp actual_index int 1 run data get storage border_hoarder:temp actual_index 1
# (Note: This logic is easier if you pass the final calculated index directly to the macro)

# 2. Prepare the item using the calculated actual_index
$data modify storage border_hoarder:temp transfer set from storage border_hoarder:temp workspace[$(actual_index)]

# 3. Add Slot and push to Minecart
$data modify storage border_hoarder:temp transfer.Slot set value $(slot)b
data modify storage border_hoarder:temp transfer.count set value 1b
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer
