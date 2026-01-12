# $page is passed to this function (0, 1, 2...)
# 1. Clear the barrel first
fill 0 -64 0 0 -64 0 air
setblock 0 -64 0 minecraft:barrel

# 2. Use a loop to fill slots 0-20
# We calculate the index: (page * 21) + slot_index
execute as @s run function boarder_hoarder:ui/fill_slot {slot:0}
execute as @s run function boarder_hoarder:ui/fill_slot {slot:1}
# ... (repeat for slots 0-20)

# 3. Add Navigation Buttons (Slots 21-26)
item replace block 0 -64 0 container.21 with paper[custom_name='{"text":"<- Previous Page","color":"yellow"}']
item replace block 0 -64 0 container.23 with compass[custom_name='{"text":"Page $(page)","color":"white"}']
item replace block 0 -64 0 container.26 with paper[custom_name='{"text":"Next Page ->","color":"yellow"}']
