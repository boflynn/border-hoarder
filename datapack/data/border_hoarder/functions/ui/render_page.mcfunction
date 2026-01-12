# This function is a Macro. Inputs: $(category), $(page)
# 1. Clear the GUI barrel (located at world center or under the map)
fill 0 -60 0 0 -60 0 air
setblock 0 -60 0 minecraft:barrel{CustomName:'{"text":"Journal: $(category)","italic":false}'}

# 2. Logic to fill slots 0-20
# We use a recursive loop or a list of 21 hardcoded calls for performance
execute as @s run function boarder_hoarder:ui/draw_item {slot:0, index:0}
execute as @s run function boarder_hoarder:ui/draw_item {slot:1, index:1}
# ... (repeat up to slot 20)

# 3. Navigation Buttons
item replace block 0 -60 0 container.21 with paper[custom_name='{"text":"Previous Page","italic":false,"color":"yellow"}']
item replace block 0 -60 0 container.23 with compass[custom_name='{"text":"Page $(page)","italic":false}']
item replace block 0 -60 0 container.26 with paper[custom_name='{"text":"Next Page","italic":false,"color":"yellow"}']
