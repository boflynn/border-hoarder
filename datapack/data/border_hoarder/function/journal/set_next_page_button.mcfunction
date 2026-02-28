# data/border_hoarder/function/journal/set_next_button.mcfunction
$item replace entity @e[tag=bh_anchor,limit=1] container.26 with minecraft:arrow[item_name={"text":"Next Page (#$(next_page_num))","color":"green","italic":false},custom_data={bh_action:next_page,bh_display:1b}]
