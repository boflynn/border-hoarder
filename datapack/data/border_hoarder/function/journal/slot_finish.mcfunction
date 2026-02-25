$data modify storage border_hoarder:temp transfer.Slot set value $(slot)b
data modify storage border_hoarder:temp transfer.count set value 1b
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer
