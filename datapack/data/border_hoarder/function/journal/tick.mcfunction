# Ran every tick

# If any of the action buttons are being held by a player, run the appropriate function
execute as @a if items entity @s player.cursor crossbow[custom_data~{bh_action:prev_page}] \
    run function border_hoarder:journal/prev_page
execute as @a if items entity @s player.cursor arrow[custom_data~{bh_action:next_page}] \
    run function border_hoarder:journal/next_page
execute as @a if items entity @s player.cursor barrier[custom_data~{bh_action:reset}] \
    run function border_hoarder:journal/reset

# Remove any bh_display items from inventories, i.e. items from the collection log
execute as @a[predicate=border_hoarder:has_ui_item] \
    run clear @s *[custom_data~{bh_display:1b}]

# Remove any bh_display item from a player's cursor; restricts action buttons to a single execution
execute as @a if items entity @s player.cursor *[custom_data~{bh_display:1b}] \
    run item replace entity @a player.cursor with minecraft:air
