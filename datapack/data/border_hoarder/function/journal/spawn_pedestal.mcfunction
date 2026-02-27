#  Kill any other collection logs
kill @e[type=chest_minecart,tag=bh_anchor]

# Create a minecart to act as the collection log
summon minecraft:chest_minecart ~ ~ ~ {Tags:["bh_anchor"],Invulnerable:1b,NoGravity:1b,CustomName:{"text":"Collection Log","color":"red"},Items:[]}
