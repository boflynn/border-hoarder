# Configure defaults if they don't already exist
execute unless data storage border_hoarder:main config run data modify storage border_hoarder:main config set value {expansion_amount:2, is_active:0b}

# Initialize discovery list only if it doesn't exist to prevent lost progress
execute unless data storage border_hoarder:main discovered run data modify storage border_hoarder:main discovered set value {}

# Alert players that the game hasn't start yet and how to start it
execute unless data storage border_hoarder:main {config:{is_active:1b}} run tellraw @a {"text": "Type '/function border_hoarder:start' to begin the challenge.", "color": "yellow"}

tellraw @a {"text": "Border Hoarder data pack loaded successfully!", "color": "green"}
