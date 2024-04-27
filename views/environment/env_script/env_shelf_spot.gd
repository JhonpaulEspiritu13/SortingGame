extends StaticBody2D

# Initalizes the panel to show.
var spot_panel

# Called when the node enters the scene tree for the first time.
func _ready():
	spot_panel = get_node("SpotPanel")
	modulate.a = 0.70

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If an item is currently being dragged, show the panel.
	if global.is_dragging:
		spot_panel.visible = true
	# If it is not, don't show the panel.
	else:
		spot_panel.visible = false
		
# If a node is an item, call its destruct function
func clear():
	# Checks through each item
	for child in get_children():
		if child.is_in_group("item"):
			# It is an item, destruct it.
			child.destruct()

func get_item_id():
	# Checks through each item
	for child in get_children():
		if child.is_in_group("item"):
			return child.id
