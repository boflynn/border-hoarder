# 1. Revoke the advancement so it can trigger again immediately
advancement revoke @s only boarder_hoarder:root

# 2. Only proceed if the game is actually active
execute if data storage boarder_hoarder:main {config:{is_active:1b}} run function boarder_hoarder:process_inventory
