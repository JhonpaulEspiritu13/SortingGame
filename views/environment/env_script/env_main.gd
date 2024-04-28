extends Node2D

var spawner_lemon
var spawner_apple
var shelf_one
var shelf_two
var checklist_01
var checklist_02
# Total points the user has.
var total_points
var total_points_label
# Decides number of points gained and lost
var points_on_win = 30
var points_on_loss = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets up the spawners, initializing their variables.
	spawner_lemon = get_node("EnvSpawnerLemon")
	spawner_lemon.init(1)
	spawner_apple = get_node("EnvSpawnerApple")
	spawner_apple.init(2)
	
	# Initializes the shelves.
	shelf_one = get_node("EnvShelf01")
	shelf_two = get_node("EnvShelf02")
	
	# Initializes the first checklist.
	checklist_01 = get_node("EnvNeeded01")
	checklist_01.init("Shelf One")
	
	# Initializes the second checklist.
	checklist_02 = get_node("EnvNeeded02")
	checklist_02.init("Shelf Two")
	
	# Initializes total points at zero.
	total_points = 0
	total_points_label = get_node("TotalPointsCounter")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
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
	# Updates the inventory of both shelves.
	shelf_one.reset_inventory()
	shelf_one.update_inventory()
	shelf_two.reset_inventory()
	shelf_two.update_inventory()
	
	# Calculates the differences between the checklist and shelf inventory.
	calculate_points(compare_dictionary(checklist_01.item_checklist, shelf_one.item_inventory))
	calculate_points(compare_dictionary(checklist_02.item_checklist, shelf_two.item_inventory))
	# Displays total points
	display_total_points()
	
	# Then generates random items to the checklist again.
	checklist_01.generate_random()
	checklist_01.display_to_container()
	checklist_02.generate_random()
	checklist_02.display_to_container()

# When the reset button is clicked.
func _on_reset_button_pressed():
	shelf_one.clear_items()
	shelf_two.clear_items()
	
# Given a boolean value, check whether or not game should add or subtract points.
func calculate_points(boolean_to_check):
	if (boolean_to_check):
		total_points = total_points + points_on_win
	else:
		total_points = total_points - points_on_loss

# Compares two dictionaries together and ensures they are the same
func compare_dictionary(dict1, dict2):
	# Iterates through each value in the dict.
	for value in dict1:
		# If a value is found not to be equal, return false.
		if dict1[value] != dict2[value]:
			return false
	# Else return the values are true.
	return true

# Displays the total number of points onto the label.
func display_total_points():
	total_points_label.text = str(total_points)
