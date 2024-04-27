extends StaticBody2D

# Shelf Objects
var shelf_spot_01
var shelf_spot_02
var shelf_spot_03
var shelf_spot_04

# Dictionary storing item names and their amount.
var item_inventory = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initializes the shelves to be used.
	shelf_spot_01 = get_node("ShelfSpot01")
	shelf_spot_02 = get_node("ShelfSpot02")
	shelf_spot_03 = get_node("ShelfSpot03")
	shelf_spot_04 = get_node("ShelfSpot04")
	
	# Initializes item_inventory to match with the global item dict.
	for item in global.itm_dict:
		item_inventory[global.itm_dict[item]] = 0
	
# When function is called, every item amount goes to zero.
func reset_inventory():
	for item in item_inventory:
		item_inventory[item] = 0
		
# When called, the inventory will update.
func update_inventory():
	if shelf_spot_01.get_item_id() != null:
		item_inventory[global.itm_dict[shelf_spot_01.get_item_id()]] += 1
	if shelf_spot_02.get_item_id() != null:
		item_inventory[global.itm_dict[shelf_spot_02.get_item_id()]] += 1
	if shelf_spot_03.get_item_id() != null:
		item_inventory[global.itm_dict[shelf_spot_03.get_item_id()]] += 1
	if shelf_spot_04.get_item_id() != null:
		item_inventory[global.itm_dict[shelf_spot_04.get_item_id()]] += 1
	
# Calls the clear functions from the shelf spots.
func clear_items():
	shelf_spot_01.clear()
	shelf_spot_02.clear()
	shelf_spot_03.clear()
	shelf_spot_04.clear()
