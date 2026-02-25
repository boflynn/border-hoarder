say 'fill chest'
data modify entity @e[tag=bh_anchor,limit=1] Items set value []

# Calculate the starting index (bh_page * 25)
execute store result storage border_hoarder:temp offset int 25 run scoreboard players get #global bh_page

function border_hoarder:journal/slot {index:0, slot:0}
function border_hoarder:journal/slot {index:1, slot:1}
function border_hoarder:journal/slot {index:2, slot:2}
function border_hoarder:journal/slot {index:3, slot:3}
function border_hoarder:journal/slot {index:4, slot:4}
function border_hoarder:journal/slot {index:5, slot:5}
function border_hoarder:journal/slot {index:6, slot:6}
function border_hoarder:journal/slot {index:7, slot:7}
function border_hoarder:journal/slot {index:8, slot:8}
function border_hoarder:journal/slot {index:9, slot:9}
function border_hoarder:journal/slot {index:10, slot:10}
function border_hoarder:journal/slot {index:11, slot:11}
function border_hoarder:journal/slot {index:12, slot:12}
function border_hoarder:journal/slot {index:13, slot:13}
function border_hoarder:journal/slot {index:14, slot:14}
function border_hoarder:journal/slot {index:15, slot:15}
function border_hoarder:journal/slot {index:16, slot:16}
function border_hoarder:journal/slot {index:17, slot:17}
function border_hoarder:journal/slot {index:18, slot:18}
function border_hoarder:journal/slot {index:19, slot:19}
function border_hoarder:journal/slot {index:20, slot:20}
function border_hoarder:journal/slot {index:21, slot:21}
function border_hoarder:journal/slot {index:22, slot:22}
function border_hoarder:journal/slot {index:23, slot:23}
function border_hoarder:journal/slot {index:24, slot:24}

item replace entity @e[tag=bh_anchor,limit=1] container.26 with minecraft:arrow[item_name={"text":"Next Page","color":"green","italic":false},custom_data={bh_action:next_page}]
#item replace block ~ ~-1 ~ container.26 with minecraft:arrow[item_name={"text":"Next Page","color":"green","italic":false},custom_data={bh_action:next_page}]
#execute as @e[tag=bh_anchor,limit=1] run data modify entity @s Items append from storage border_hoarder:temp transfer
