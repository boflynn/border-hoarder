# Decrement cooldown for all players
execute as @a[scores={bh_click_cooldown=1..}] run scoreboard players remove @s bh_click_cooldown 1

# Only trigger next_page if the player has no active cooldown
execute as @a[scores={bh_click_cooldown=0}] if items entity @s inventory.* arrow[custom_data~{bh_action:next_page}] run function border_hoarder:journal/next_page

# Anti-Theft: Clear arrows after checking for the trigger
clear @a arrow[custom_data~{bh_display:1b}]

scoreboard players add #global bh_timer 1
execute if score #global bh_timer matches 20.. run scoreboard players set #global bh_timer 0
execute if score #global bh_timer matches 0 as @e[tag=bh_anchor] at @s run function border_hoarder:journal/fill_chest
