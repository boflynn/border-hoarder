# Called from the inventory_changed advancement trigger

# Revoke the advancement so it can trigger again immediately
advancement revoke @s only border_hoarder:root

# Only proceed if the game is actually active
execute if data storage border_hoarder:main {config:{is_active:1b}} run function border_hoarder:process_inventory
