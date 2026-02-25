# Called from check_item_discovered.mcfunction
# Receives an item_id argument from the caller for an undiscovered item

# Mark the item as discovered in storage
$data modify storage border_hoarder:main discovered."$(item_id)" set value 1b

# Update the scoreboard
scoreboard players add @s bh_discovered 1

# Call the expansion macro by passing the config data
function border_hoarder:apply_border_expansion with storage border_hoarder:main config

# Global Announcement
$tellraw @a ["",{"selector":"@s","color":"white","bold":true},{"text":" discovered ","color":"gray","bold":false},{"text":"$(item_id)","color":"gold","bold":true},{"text":"!","color":"gray","bold":false}]

# Effects
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 0.7 1.2

# Add 1 to the global total player whenever this runs
scoreboard players add #global_total bh_total 1
