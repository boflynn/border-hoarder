execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run scoreboard players set #global bh_page 0
execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run function border_hoarder:journal/calculate_missing
execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run tag @s add bh_viewing


# Decrement cooldown for all players
execute as @a[scores={bh_click_cooldown=1..}] run scoreboard players remove @s bh_click_cooldown 1
#execute unless entity @a[distance=..5] at @e[tag=bh_anchor] run scoreboard players set #global bh_page 0
execute as @a[tag=bh_viewing] at @s unless entity @e[tag=bh_anchor,distance=..5] run tag @s remove bh_viewing

# Detect the arrow in any slot (including the cursor) and trigger next_page
execute as @a if items entity @s player.cursor arrow[custom_data~{bh_action:next_page}] run function border_hoarder:journal/next_page

# Anti-Theft: Clear arrows after checking for the trigger
clear @a arrow[custom_data~{bh_display:1b}]

item replace entity @a player.cursor with minecraft:air
scoreboard players add #global bh_timer 1
execute if score #global bh_timer matches 20.. run scoreboard players set #global bh_timer 0
execute if score #global bh_timer matches 0 as @e[tag=bh_anchor] at @s run function border_hoarder:journal/open_chest
