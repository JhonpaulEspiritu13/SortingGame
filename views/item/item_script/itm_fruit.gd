extends Node2D

# Initializes variables required for program to work.
# https://www.youtube.com/watch?v=uhgswVkYp0o 
var draggable = false # Ensures object is not being dragged.
var is_inside_droppable = false # If object is inside a dropable area.
var body_ref # Reference to object to be dragged to.
var body_offset
var offset: Vector2 
var initialPos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				# Don't know if this is a good way to do it, but it is certainly a way to do it.
				# Gets the x and y size of the shelf spot the item is accessing. (Divided by 2 to get center)
				var body_size_x = (body_ref.get_node("SpotCollisonShape2D").shape.size.x / 2)
				var body_size_y = (body_ref.get_node("SpotCollisonShape2D").shape.size.y / 2)
				
				# Calculates the offset position to put item at.
				var body_offset = Vector2((body_ref.global_position.x + body_size_x), 
							(body_ref.global_position.y + body_size_y))
				
				# Tweens the item to go to calculated spot.
				tween.tween_property(self, "position", body_offset, 0.2).set_ease(Tween.EASE_OUT)
			else:
				# Tweens item to go back to inital position.
				tween.tween_property(self, "global_position",initialPos, 0.2).set_ease(Tween.EASE_OUT)

# Once the mouse enters the area, set dragable to true and pop out the image image.
func _on_mouse_entered():
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05,1.05)

# Once the mouse leaves, return to normal.
func _on_area_2d_mouse_exited():
	if not global.is_dragging: # Ensures mouse is not being dragged so this function doesn't run.
		draggable = true 
		scale = Vector2(1,1)

func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('shelf_dropable'):
		is_inside_droppable = true
		body.modulate = Color(Color.GOLD, 1)
		body_ref = body

func _on_area_2d_body_exited(body:StaticBody2D):
	if not body.is_in_group('shelf_dropable'):
		is_inside_droppable = false
		



