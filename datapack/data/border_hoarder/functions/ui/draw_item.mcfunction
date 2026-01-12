# $index = (page * 21) + slot
# 1. Fetch the item data from the master list
$data modify storage boarder_hoarder:temp current_item set from storage boarder_hoarder:lists $(category)[$(index)]

# 2. If it exists in 'discovered', show the real item
$execute if data storage boarder_hoarder:main discovered."$(id)" run item replace block 0 -60 0 container.$(slot) with $(id)[lore=['{"text":"Status: Found!","color":"green","italic":false}']]

# 3. If NOT discovered, show a hidden icon
$execute unless data storage boarder_hoarder:main discovered."$(id)" run item replace block 0 -60 0 container.$(slot) with gray_stained_glass_pane[custom_name='{"text":"???","color":"red","italic":false}',lore=['{"text":"Status: Missing","color":"red","italic":false}']]
