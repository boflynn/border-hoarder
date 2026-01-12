# ==========================================
# BOARDER HOARDER: SETUP
# ==========================================

# 1. Create the Scoreboard for the Leaderboard
# This tracks how many "First Discoveries" each player has.
scoreboard objectives add bh_discovered dummy "§6Items Discovered"
scoreboard objectives setdisplay sidebar bh_discovered

# 2. Initialize Data Storage (The Config)
# We store these in NBT so they persist and can be used in macros.
storage boarder_hoarder:main merge value {
  config: {
    expansion_amount: 2,
    is_active: 0b
  }
}

# 3. Initialize the Discovery List
# This creates an empty object to store item names as they are found.
# We use 'merge' so we don't accidentally wipe progress on a reload.
storage boarder_hoarder:main merge value {discovered: {}}

# 4. Provide Feedback
tellraw @a {"text": "Boarder Hoarder data pack loaded successfully!", "color": "green"}
tellraw @a {"text": "Type '/function boarder_hoarder:start' to begin the challenge.", "color": "yellow"}

# Building Blocks Category
storage boarder_hoarder:lists set value {building:[{id:"minecraft:stone",name:"Stone"},{id:"minecraft:cobblestone",name:"Cobblestone"},{id:"minecraft:oak_planks",name:"Oak Planks"}]}

# Nature Category
storage boarder_hoarder:lists append value {nature:[{id:"minecraft:grass_block",name:"Grass Block"},{id:"minecraft:dirt",name:"Dirt"},{id:"minecraft:oak_log",name:"Oak Log"}]}

# Tools & Utilities
storage boarder_hoarder:lists append value {tools:[{id:"minecraft:wooden_pickaxe",name:"Wooden Pickaxe"},{id:"minecraft:crafting_table",name:"Crafting Table"}]}
