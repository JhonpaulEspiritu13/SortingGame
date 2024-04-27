extends Node2D

var child_count
var is_empty
var spawn_id
var spawn_node
var spawn_panel

func init(item_id):
	# Initializes with new item id.
	spawn_id = item_id
	# Gets the desired item to spawn.
	spawn_node = load("res://scenes/" + global.itm_dict[spawn_id] + ".tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_id = 1
	# Gets the desired item to spawn.
	spawn_node = load("res://scenes/" + global.itm_dict[spawn_id] + ".tscn")
	
	# Ensures that the spawn panel does not appear in-game.
	spawn_panel = get_node("SpawnerPanel")
	spawn_panel.visible = false
	
	# Sets initial amount of children
	child_count = get_child_count()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If there are the same amount of children as there were before,
	# this spawner is empty.
	if get_child_count() == child_count:
		is_empty = true
	# Otherwise, there is an item currently in here.
	else:
		is_empty = false
	
# Instantiates a new object specified with the ID.
func create_item_instance():
	# If the spawner node was initialized:
	if spawn_node != null:
		# Create a new item.
		var itm_instance = spawn_node.instantiate()
		itm_instance.init(spawn_id)
		
		# Ensures that no matter the size of the spawner's panel, the item will spawn at its x and y coordinates.
		var panel_size_x = (spawn_panel.size.x / 2)
		var panel_size_y = (spawn_panel.size.y / 2)
		
		# Calculates the offset position to put item at.
		var panel_offset = Vector2((spawn_panel.global_position.x + panel_size_x), 
					(spawn_panel.global_position.y + panel_size_y))
		
		# Sets item properties.
		itm_instance.position = panel_offset
		itm_instance.top_level = true
		
		# Adds a new child to instance.
		add_child(itm_instance)
		print(itm_instance.get_parent())
	# Prints out an error if init was not called.
	else:
		print("Spawner not initialized with item!")
