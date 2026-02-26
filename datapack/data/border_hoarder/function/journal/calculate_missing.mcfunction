data modify storage border_hoarder:temp current_missing set value []

function border_hoarder:journal/populate_missing_items

data modify storage border_hoarder:temp workspace set from storage border_hoarder:temp current_missing
