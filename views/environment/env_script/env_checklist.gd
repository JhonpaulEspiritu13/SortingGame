extends Node2D

# The shelf name to be used and the controls to be used.
var shelf_name
var shelf_label
var item_container
# Dictionary for holding the potential item values.
var item_checklist = {}

# List for holding object values
var item_images = []

# Initializes variables.
func init(name_of_object):
	shelf_name = name_of_object
	shelf_label.text = shelf_name + ": "
	
func _ready():
	shelf_label = get_node("ShelfNameLabel")
	item_container = get_node("ItemContainer")
	
	# Initializes item_inventory to match with the global item dict.
	for item in global.itm_dict:
		item_checklist[global.itm_dict[item]] = 0
	# Generates a random amount of items in dictionary to start.
	generate_random()
		
	# Generate all the item images created from the dictionary.
	for i in item_checklist:
		item_images.append(load(generate_image_path(i)))
		
	# Displays current items into the container.
	display_to_container()
	
func generate_image_path(image_name):
	return "res://views/item/item_assets/" + image_name + ".png"
		
# Generates a random list required in the item dictionary.
func generate_random():
	# Parameters for the range in use.
	var min_required = 0
	var max_required = 4
	# Creates a new random generator.
	var rng = RandomNumberGenerator.new()
	
	# Iterates through each current item in the list.
	for item in item_checklist:
		# Creates a random range based on parameters.
		var range_result = rng.randi_range(min_required, max_required)
		# Adds range to the checklist, and subtracts the max required for the next item.
		item_checklist[item] = range_result
		max_required = max_required - range_result
		
# Generates a Texture Rect using the image given.
func generate_texture_rect(image_to_load):
	var new_rect = TextureRect.new()
	# Sets the texture and minimum size.
	new_rect.set_texture(image_to_load)
	new_rect.set_custom_minimum_size(Vector2(25, 25))
	# Then sets the EXPAND and STRETCH mode to fit container.
	new_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
	new_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT
	return new_rect

# Generates a Rich Label item using the text given.
func generate_rich_label(text_to_load):
	var new_label = RichTextLabel.new()
	# Sets text and the minimum size.
	new_label.text = text_to_load
	new_label.set_custom_minimum_size(Vector2(25, 25))
	# Returns the label.
	return new_label
		
# Displays to the container object all the items needed in the checklist.
func display_to_container():
	# For each display node in the current container, free them to make room for new items.
	for node in item_container.get_children():
		node.queue_free()
	
	# Keep a counter to index item images.
	var counter = 0
	for item in item_checklist:
		# Ensures that an item amount of zero will not be displayed.
		if (item_checklist[item] != 0):
			item_container.add_child(generate_texture_rect(item_images[counter]))
			item_container.add_child(generate_rich_label("x " + str(item_checklist[item])))
		# Add to index of item images.
		counter = counter + 1
