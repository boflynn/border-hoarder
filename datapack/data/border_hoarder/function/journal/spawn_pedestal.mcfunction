# # 1. Place and Name the barrel
# setblock ~ ~-1 ~ minecraft:barrel
# data merge block ~ ~-1 ~ {CustomName:{"color":"red","text":"Collection Log"}}

# # 3. Summon a Marker
# # This acts as the "Home Base" so the shield knows where to return
# kill @e[type=marker,tag=bh_anchor,distance=..2]
# summon marker ~ ~-1 ~ {Tags:["bh_anchor"]}

# 1. Kill any old menus nearby
kill @e[type=chest_minecart,tag=bh_anchor]

# 2. Summon the "Invulnerable" Minecart
# NoGravity:1b keeps it from rolling away
# Invulnerable:1b stops players from punching it
#summon minecraft:chest_minecart ~ ~ ~ {Tags:["bh_anchor"],Invulnerable:1b,NoGravity:1b,CustomName:{"text":"Collection Log","color":"red"}}
summon minecraft:chest_minecart ~ ~ ~ {Tags:["bh_anchor"],Invulnerable:1b,NoGravity:1b,CustomName:{"text":"Collection Log","color":"red"},Items:[]}
