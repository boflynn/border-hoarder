# 1. Create the Scoreboard for the Leaderboard
# This tracks how many "First Discoveries" each player has.

# 2. Initialize Config ONLY if it doesn't exist yet
# This prevents /reload from turning the game off (is_active: 0b)
execute unless data storage border_hoarder:main config run data modify storage border_hoarder:main config set value {expansion_amount:2, is_active:0b}

# 3. Initialize Discovery List ONLY if it doesn't exist
# This ensures progress isn't wiped on /reload
execute unless data storage border_hoarder:main discovered run data modify storage border_hoarder:main discovered set value {}

# 4. Provide Feedback
execute unless data storage border_hoarder:main {config:{is_active:1b}} run tellraw @a {"text": "Type '/function border_hoarder:start' to begin the challenge.", "color": "yellow"}
tellraw @a {"text": "Border Hoarder data pack loaded successfully!", "color": "green"}
