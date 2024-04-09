extends StaticBody2D

# Shelf Objects
var shelf_spot_01
var shelf_spot_02
var shelf_spot_03
var shelf_spot_04

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initializes the shelves to be used.
	shelf_spot_01 = get_node("ShelfSpot01/SpotPanel")
	shelf_spot_02 = get_node("ShelfSpot02/SpotPanel")
	shelf_spot_03 = get_node("ShelfSpot03/SpotPanel")
	shelf_spot_04 = get_node("ShelfSpot04/SpotPanel")
	
	# Then colors them
	shelf_spot_01.modulate = Color(Color.GOLD, 0.5)
	shelf_spot_02.modulate = Color(Color.GOLD, 0.5)
	shelf_spot_03.modulate = Color(Color.GOLD, 0.5)
	shelf_spot_04.modulate = Color(Color.GOLD, 0.5)
	pass
