# 1. Save the macro index into temporary storage
$data modify storage border_hoarder:temp macro_index set value $(index)

# 2. Move that NBT value into the scoreboard so we can do math with it
execute store result score #index_calc dummy run data get storage border_hoarder:temp macro_index

# 3. Add the page offset (start_index) to our current slot index
# We assume '#global_offset' holds the value (bh_page * 25)
execute store result score #actual_index dummy run scoreboard players operation #index_calc dummy += #global_offset dummy

# 4. Save the final calculated index back to storage to pull the item
execute store result storage border_hoarder:temp actual_index int 1 run scoreboard players get #actual_index dummy

# 1. We expect 'actual_index' to be passed in as a macro argument
# This line pulls the item from the workspace using that argument
$data modify storage border_hoarder:temp transfer set from storage border_hoarder:main workspace[$(actual_index)]

# 2. Assign slot and push to minecart
$data modify storage border_hoarder:temp transfer.Slot set value $(slot)b
data modify storage border_hoarder:temp transfer.count set value 1b
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer