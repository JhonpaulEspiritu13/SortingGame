extends StaticBody2D

# Initalizes the panel to show.
var spot_panel
# If the current item spot is available
var is_open = true

# Called when the node enters the scene tree for the first time.
func _ready():
	spot_panel = get_node("SpotPanel")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If an item is currently being dragged, show the panel.
	if global.is_dragging:
		spot_panel.visible = true
	# If it is not, don't show the panel.
	else:
		spot_panel.visible = false
