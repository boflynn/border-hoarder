# This function is called with $(index) and $(slot)
# It takes the item from the workspace at $(index)
# but adds the 'Slot' tag before putting it in the barrel.

#$tellraw @a "Placing item from workspace index $(index) into slot $(slot)"
# $item replace entity @e[tag=bh_anchor,limit=1] container.$(slot) from storage border_hoarder:temp workspace[$(index)]
# $execute as @e[tag=bh_menu,limit=1] run item replace entity @s container.$(slot) from storage border_hoarder:temp workspace[$(index)]
# slot.mcfunction

# slot.mcfunction
# 1. Prepare the item in a 'transfer' storage
$data modify storage border_hoarder:temp transfer set from storage border_hoarder:temp workspace[$(index)]

# 2. Add the Slot byte
$data modify storage border_hoarder:temp transfer.Slot set value $(slot)b
data modify storage border_hoarder:temp transfer.count set value 1b

# 3. Push it into the Minecart (Use 'at @s' for stability)
execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer
