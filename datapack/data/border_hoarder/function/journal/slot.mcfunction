# Receive 'actual_index' and 'slot' from the loop
# We use $(actual_index) directly in the path
# $say [DEBUG] Attempting to pull index $(actual_index) for slot $(slot)
$data modify storage border_hoarder:temp transfer set from storage border_hoarder:temp workspace[$(actual_index)]

# Check if an item exists at this index before trying to place it
# We pass the slot to the finisher to ensure it goes to the right UI hole
$execute if data storage border_hoarder:temp transfer run function border_hoarder:journal/slot_finish {slot:$(slot)}
