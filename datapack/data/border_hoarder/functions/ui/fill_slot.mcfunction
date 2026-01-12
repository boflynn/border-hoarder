# Determine which item in the master list to show
$data modify storage boarder_hoarder:temp current_item set from storage boarder_hoarder:lists items[$(index)]

# IF DISCOVERED: Show the actual item
$execute if data storage boarder_hoarder:main discovered."$(id)" run item replace block 0 -64 0 container.$(slot) with $(id)[lore=['{"text":"STATUS: DISCOVERED","color":"green"}']]

# IF NOT DISCOVERED: Show a Gray Stained Glass Pane
$execute unless data storage boarder_hoarder:main discovered."$(id)" run item replace block 0 -64 0 container.$(slot) with gray_stained_glass_pane[custom_name='{"text":"???","color":"red"}',lore=['{"text":"STATUS: MISSING","color":"red"}']]
