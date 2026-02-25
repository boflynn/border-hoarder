# If a player is looking at/near the barrel, keep it filled.
# execute at @e[tag=bh_anchor] as @a[distance=..2] run function border_hoarder:journal/calculate_missing
# execute at @e[tag=bh_anchor] run function border_hoarder:journal/fill_chest

# execute as @a if items entity @s inventory.* arrow[custom_data={bh_action:next_page}] run function border_hoarder:journal/next_page

# 1. Keep the inventory updated (C# logic)
# execute at @e[tag=bh_anchor] run function border_hoarder:journal/fill_chest

#execute as @a if items entity @s inventory.* arrow[custom_data:{bh_action:next_page}] run function border_hoarder:journal/next_page
#execute as @a if items entity @s container.* arrow[custom_data~{bh_action:next_page}] run function border_hoarder:journal/next_page

execute as @a if items entity @s inventory.*[custom_data~{bh_action:next_page}] run function border_hoarder:journal/next_page

#execute as @a store success score @s bh_temp run clear @s arrow[custom_data~{bh_action:next_page}]
#execute as @a if score @s bh_temp matches 1.. run function border_hoarder:journal/next_page

# 2. The Anti-Theft Snatcher
clear @a *[custom_data={bh_display:1b}]
#clear @a *[custom_data={bh_action:next_page}]
#execute as @e[tag=bh_anchor] at @s run tp @s ~ ~ ~

scoreboard players add #global bh_timer 1
execute if score #global bh_timer matches 20.. run scoreboard players set #global bh_timer 0
execute if score #global bh_timer matches 0 as @e[tag=bh_anchor] at @s run function border_hoarder:journal/fill_chest

#execute as @e[tag=bh_anchor] at @s unless data entity @s Items[0] run function border_hoarder:journal/fill_chest
