# Ran every tick

# Execute whenever a player gets within 5 blocks while not looking at the collection log
execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run scoreboard players set #global bh_page 0
execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run function border_hoarder:journal/calculate_missing
execute as @e[tag=bh_anchor] at @s as @a[distance=..5,tag=!bh_viewing] run tag @s add bh_viewing

# Decrement cooldown for all players
execute as @a[scores={bh_click_cooldown=1..}] run scoreboard players remove @s bh_click_cooldown 1

# Remove viewing tag from anyone more than 5 blocks away
execute as @a[tag=bh_viewing] at @s unless entity @e[tag=bh_anchor,distance=..5] run tag @s remove bh_viewing

# If the next page arrow is in any player's cursor, move to next page
execute as @a if items entity @s player.cursor arrow[custom_data~{bh_action:next_page}] run function border_hoarder:journal/next_page

# If the first page compass is in any player's cursor, move to first page
execute as @a if items entity @s player.cursor compass[custom_data~{bh_action:first_page}] run scoreboard players set #global bh_page 0

# Remove any bh_display items from inventories, i.e. items in the collection log
execute as @a[predicate=border_hoarder:has_ui_item] run clear @s *[custom_data~{bh_display:1b}]

# Remove any bh_display item from a player's cursor
execute as @a if items entity @s player.cursor *[custom_data~{bh_display:1b}] run item replace entity @a player.cursor with minecraft:air

# TODO - What is this doing again?
scoreboard players add #global bh_timer 1
execute if score #global bh_timer matches 20.. run scoreboard players set #global bh_timer 0
execute if score #global bh_timer matches 0 as @e[tag=bh_anchor] at @s run function border_hoarder:journal/open_chest
