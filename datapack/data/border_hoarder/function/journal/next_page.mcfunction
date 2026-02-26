execute as @s[scores={bh_click_cooldown=0}] run scoreboard players add #global bh_page 1
scoreboard players set @s bh_click_cooldown 2
function border_hoarder:journal/fill_chest
