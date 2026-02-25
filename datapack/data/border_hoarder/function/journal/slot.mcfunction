# Pull item from workspace using the passed actual_index
$data modify storage border_hoarder:temp transfer set from storage border_hoarder:main workspace[$(actual_index)]

# Only proceed to place if an item actually exists at this index
$execute if data storage border_hoarder:temp transfer run function border_hoarder:journal/slot_finish {slot:$(slot)}
