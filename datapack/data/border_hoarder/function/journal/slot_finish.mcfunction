# Set the slot number on the item we just found
# $say [DEBUG] Attempting to pull slot $(slot)
$data modify storage border_hoarder:temp transfer.Slot set value $(slot)b
data modify storage border_hoarder:temp transfer.count set value 1b

# Push it to the minecart
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer

# Clean up the transfer object so it doesn't leak into the next loop
data remove storage border_hoarder:temp transfer
