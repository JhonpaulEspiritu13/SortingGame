extends Node2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

# Dictionary that holds an item's name by its ID.
var itm_dict = {
	1: "itm_lemon",
	2: "itm_apple",
}

# Variable to check if an object is currently being dragged.
var is_dragging = false
