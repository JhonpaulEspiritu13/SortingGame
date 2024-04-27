extends Node2D

var spawner_lemon
var spawner_apple
var shelf_one
var shelf_two

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets up the spawners, initializing their variables.
	spawner_lemon = get_node("EnvSpawnerLemon")
	spawner_lemon.init(1)
	spawner_apple = get_node("EnvSpawnerApple")
	spawner_apple.init(2)
	
	shelf_one = get_node("EnvShelf01")
	shelf_two = get_node("EnvShelf02")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Spawn Lemon
	if spawner_lemon.is_empty:
		spawn_lemon()
	# Spawn Apple
	if spawner_apple.is_empty:
		spawn_apple()
	
	

func spawn_lemon():
	spawner_lemon.create_item_instance()

func spawn_apple():
	spawner_apple.create_item_instance()

# When the confirm button is clicked
func _on_confirm_button_pressed():
	
	shelf_one.reset_inventory()
	shelf_one.update_inventory()
	for i in shelf_one.item_inventory:
		print(i + str(shelf_one.item_inventory[i]))

# When the reset button is clicked.
func _on_reset_button_pressed():
	shelf_one.clear_items()
	shelf_two.clear_items()
